class Cms::Admin::Tool::ConvertSettingsController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    return error_auth unless Core.user.has_auth?(:manager)

    if (site_url = params.dig(:item, :site_url))
      @item = ::Tool::ConvertSetting.find_by(site_url: site_url) if site_url.present?
      @item ||= ::Tool::ConvertSetting.new(setting_params)
    end
  end

  def index
    @items = ::Tool::ConvertSetting.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show
    @item = ::Tool::ConvertSetting.find(params[:id])
  end

  def new
    @item.creator_group_relation_type = 0 if @item.creator_group_relation_type.blank?
  end

  def create
    if @item.new_record?
      if @item.save
        flash[:notice] = "登録処理が完了しました。（#{I18n.l Time.now}）"
      else
        flash[:alert] = '登録処理に失敗しました。'
      end
    else
      if @item.update_attributes(setting_params)
        flash[:notice] = "更新処理が完了しました。（#{I18n.l Time.now}）"
      else
        flash[:alert] = '更新処理に失敗しました。'
      end
    end
    redirect_to cms_tool_convert_settings_path(item: {site_url: @item.site_url})
  end

  def destroy
    @item = ::Tool::ConvertSetting.find(params[:id])
    _destroy @item
  end

  private

  def setting_params
    return {} unless params[:item]
    params.require(:item).permit(
      :site_url, :title_tag, :body_tag, :updated_at_tag, :updated_at_regexp, :published_at_tag, :published_at_regexp,
      :creator_group_tag, :creator_group_regexp, :creator_group_from_url_regexp,
      :creator_group_relation_type, :creator_group_relations,
      :category_tag, :category_regexp, :category_relations,
    )
  end
end
