class GpArticle::Admin::DocsController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base
  include Sys::Controller::Scaffold::Publication

  layout :select_layout

  before_action :hold_document, only: [:edit]
  before_action :check_intercepted, only: [:update]

  before_action :index_options, only: [:index], if: -> { params[:options] }
  before_action :user_options, only: [:index], if: -> { params[:user_options] }

  keep_params :target, :target_state, :target_public

  def pre_dispatch
    @content = GpArticle::Content::Doc.find(params[:content])
    return error_auth unless Core.user.has_priv?(:read, item: @content.concept)
    return redirect_to url_for(params.permit(:target, :target_state, :target_public).merge(action: :index)) if params[:reset_criteria]

    @item = @content.docs.find(params[:id]) if params[:id].present?
  end

  def index
    criteria = doc_criteria
    @items = GpArticle::DocsFinder.new(@content.docs, Core.user).search(criteria).distinct
                                  .order(updated_at: :desc)
                                  .preload(:prev_edition, :content, creator: [:user, :group])

    if params[:csv]
      return export_csv(@items, GpArticle::Doc::Criteria.new(criteria))
    else
      @items = @items.paginate(page: params[:page], per_page: 30)
    end

    _index @items
  end

  def index_options
    @items = if params[:category_id].present?
               if (category = GpCategory::Category.find_by(id: params[:category_id]))
                 params[:public] ? category.public_docs : category.docs
               else
                 category.docs.none
               end
             else
               params[:public] ? @content.public_docs : @content.docs
             end

    if params[:exclude]
      docs_table = @items.table
      @items = @items.where(docs_table[:name].not_eq(params[:exclude]))
    end

    if params[:group_id] || params[:user_id]
      inners = []
      if params[:group_id]
          groups = Sys::Group.arel_table
          inners << :group
      end
      if params[:user_id]
          users = Sys::User.arel_table
          inners << :user
      end
      @items = @items.joins(:creator => inners)

      @items = @items.where(groups[:id].eq(params[:group_id])) if params[:group_id]
      @items = @items.where(users[:id].eq(params[:user_id])) if params[:user_id]
    end

    @items = @items.map { |item| [view_context.truncate(item.title, length: 50), item.id] }
    render html: view_context.options_for_select([nil] + @items), layout: false
  end

  def user_options
    @group = Sys::Group.find(params[:group_id])
    render html: view_context.options_from_collection_for_select(@group.users, :id, :name), layout: false
  end

  def show
    _show @item
  end

  def new
    @item = @content.docs.build

    if @content.default_category
      @item.in_category_ids = { @content.default_category.category_type_id.to_s => [@content.default_category.id.to_s] }
    end
    if @content.default_template
      @item.template_id = @content.default_template.id
    end
  end

  def create
    @item = @content.docs.build(doc_params)
    @item.replace_words_with_dictionary

    if params[:link_check_in_body]
      @item.link_check_results = @item.check_links
      return render :new
    end

    if params[:accessibility_check]
      @item.modify_accessibility if @item.in_modify_accessibility_check == '1'
      @item.accessibility_check_results = @item.check_accessibility
      return render :new
    end

    new_state = params.keys.detect{|k| k =~ /^commit_/ }.try(:sub, /^commit_/, '')
    @item.state = new_state if new_state.present? && @content.state_options.any?{|v| v.last == new_state }

    location = ->(d){ edit_gp_article_doc_url(@content, d) } if @item.state_draft?
    _create(@item, location: location) do

      @item = @content.docs.find_by(id: @item.id)
      @item.send_approval_request_mail if @item.state_approvable?

      publish_by_update(@item) if @item.state_public?
    end
  end

  def edit
    if @item.will_be_replaced?
      return redirect_to(edit_gp_article_doc_url(@content, @item.next_edition))
    elsif @item.state_public?
      return redirect_to(edit_gp_article_doc_url(@content, @item.duplicate(:replace)))
    end
  end

  def update
    @item.attributes = doc_params
    @item.replace_words_with_dictionary

    if params[:link_check_in_body]
      @item.link_check_results = @item.check_links
      return render :edit
    end

    if params[:accessibility_check]
      @item.modify_accessibility if @item.in_modify_accessibility_check == '1'
      @item.accessibility_check_results = @item.check_accessibility
      return render :edit
    end

    new_state = params.keys.detect{|k| k =~ /^commit_/ }.try(:sub, /^commit_/, '')
    @item.state = new_state if new_state.present? && @content.state_options.any?{|v| v.last == new_state }

    location = url_for(action: 'edit') if @item.state_draft?
    _update(@item, location: location) do
      @item = @content.docs.find_by(id: @item.id)
      @item.send_approval_request_mail if @item.state_approvable?

      publish_by_update(@item) if @item.state_public?

      @item.close if !@item.public? && !@item.will_replace? # Never use "state_public?" here

      release_document
    end
  end

  def destroy
    _destroy(@item) do
      send_broken_link_notification
    end
  end

  def publish
    _publish(@item)
  end

  def publish_by_update(item)
    if item.publish
      flash[:notice] = '公開処理が完了しました。'
    else
      flash[:alert] = '公開処理に失敗しました。'
    end
  end

  def close(item)
    _close(@item) do
      send_broken_link_notification
    end
  end

  def duplicate(item)
    if item.duplicate
      redirect_to url_for(:action => :index), notice: '複製処理が完了しました。'
    else
      redirect_to url_for(:action => :index), alert: '複製処理に失敗しました。'
    end
  end

  def approve
    if @item.approvers.include?(Core.user)
      @item.approve(Core.user) do
        @item.update_columns(
          state: (@item.queued_tasks.where(name: 'publish').exists? ? 'prepared' : 'approved'),
          recognized_at: Time.now
        )
        @item.enqueue_tasks
        Sys::OperationLog.log(request, item: @item)

        if @item.state_approved? && @content.publish_after_approved?
          @item.publish
          Sys::OperationLog.log(request, item: @item, do: 'publish')
        end

        @item.send_approved_notification_mail
      end
    end
    redirect_to url_for(:action => :show), notice: '承認処理が完了しました。'
  end

  def passback
    if @item.state_approvable? && @item.approvers.include?(Core.user)
      @item.passback(Core.user, comment: params[:comment]) do
        @item.update_column(:state, 'draft')
      end
      redirect_to gp_article_doc_url(@content, @item), notice: '差し戻しが完了しました。'
    else
      redirect_to gp_article_doc_url(@content, @item), notice: '差し戻しに失敗しました。'
    end
  end

  def pullback
    if @item.state_approvable? && @item.approval_requesters.include?(Core.user)
      @item.pullback(comment: params[:comment]) do
        @item.update_column(:state, 'draft')
      end
      redirect_to gp_article_doc_url(@content, @item), notice: '引き戻しが完了しました。'
    else
      redirect_to gp_article_doc_url(@content, @item), notice: '引き戻しに失敗しました。'
    end
  end

  protected

  def select_layout
    if request.smart_phone? && action_name.in?(%w(new create edit update))
      'admin/gp_article'
    end
  end

  def hold_document
    unless (holds = @item.holds).empty?
      holds = holds.each{|h| h.destroy if h.user == Core.user }.reject(&:destroyed?)
      alerts = holds.map { |hold| "#{hold.group_and_user_name}さんが#{hold.formatted_updated_at}から編集中です。" }
      flash.now[:alert] = "<ul><li>#{alerts.join('</li><li>')}</li></ul>".html_safe unless alerts.blank?
    end
    @item.holds.create(user: Core.user)
  end

  def check_intercepted
    unless @item.holds.detect{|h| h.user == Core.user }
      flash[:alert] = "#{@item.last_editor.try(:group_and_user_name)}さんが記事を編集したため、編集内容を反映できません。"
      render :action => :edit
    end
  end

  def release_document
    @item.holds.destroy_all
  end

  def send_broken_link_notification
    return unless @content.notify_broken_link?
    if @item.state_public? || @item.state_closed?
      @item.backlinked_items.each do |doc|
        GpArticle::Admin::Mailer.broken_link_notification(@item, doc).deliver_now
      end
    end
  end

  private

  def doc_criteria
    criteria = params[:criteria] ? params[:criteria].to_unsafe_h : {}

    if params[:target_public].blank?
      if Core.user.has_auth?(:manager)
        params[:target] = 'all' if params[:target].blank?
        params[:target_state] = 'processing' if params[:target_state].blank?
      else
        params[:target] = 'user' if params[:target].blank? || params[:target] == 'all'
        params[:target_state] = 'processing' if params[:target_state].blank?
      end
    end

    if params[:target] == '' && params[:target_state] == ''
      criteria[:target] = 'all'
      criteria[:target_state] = 'public'
    else
      criteria[:target] = params[:target]
      criteria[:target_state] = params[:target_state]
    end

    criteria
  end

  def doc_params
    params.require(:item).permit(
      :template_id, :title, :href, :target, :subtitle, :summary, :list_image,
      :lang, :body, :body_more, :body_more_link_text,
      :feature_1, :feature_2, :raw_tags, :qrcode_state, :display_published_at, :display_updated_at, :keep_display_updated_at,
      :event_state, :event_started_on, :event_ended_on, :event_will_sync, :event_note,
      :marker_state, :marker_icon_category_id, :mobile_title, :mobile_body,
      :concept_id, :layout_id, :name, :filename_base, :terminal_pc_or_smart_phone, :terminal_mobile,
      :meta_description, :meta_keywords, :og_type, :og_title, :og_description, :og_image,
      :in_tmp_id, :in_ignore_link_check, :in_ignore_accessibility_check, :in_modify_accessibility_check,
      :template_values => params[:item][:template_values].try(:keys),
      :creator_attributes => [:id, :group_id, :user_id],
      :tasks_attributes => [:id, :name, :process_at],
      :inquiries_attributes => [:id, :state, :group_id, :_destroy],
      :maps_attributes => [:id, :name, :title, :map_lat, :map_lng, :map_zoom, :markers_attributes => [:id, :name, :lat, :lng]],
      :editable_groups_attributes => [:id, :group_id],
      :related_docs_attributes => [:id, :name, :content_id, :_destroy],
      :in_rel_doc_ids => [],
      :in_share_accounts => [],
      :in_approval_flow_ids => [],
    ).tap do |permitted|
      [:in_file_names, :in_category_ids, :in_event_category_ids, :in_marker_category_ids, :in_approval_assignment_ids].each do |key|
        permitted[key] = params[:item][key].to_unsafe_h if params[:item][key]
      end
    end
  end

  def export_csv(items, criteria)
    require 'csv'
    data = CSV.generate(force_quotes: true) do |csv|
      csv << [criteria.to_csv_string]
      csv << ['記事番号', 'タイトル', 'ディレクトリ名', '所属', '作成者', '更新日時', '状態']
      items.each do |item|
        csv << [
          item.serial_no,
          item.title,
          item.name,
          item.creator.group.try(:name),
          item.creator.user.try(:name),
          item.updated_at ? I18n.l(item.updated_at) : nil,
          item.status.name
        ]
      end
    end

    data = NKF.nkf('-s', data)
    send_data data, type: 'text/csv', filename: "gp_article_docs_#{Time.now.to_i}.csv"
  end
end
