require 'csv'
class Cms::Admin::Tool::ConvertDocsController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    return error_auth unless Core.user.has_auth?(:manager)
    return redirect_to(request.env['PATH_INFO']) if params[:reset]
    @item = ::Tool::ConvertDoc.find(params[:id]) if params[:id].present?
  end

  def index
    @items = ::Tool::ConvertDoc.in_site(Core.site)
                               .search_with_criteria(params[:criteria])
                               .order(updated_at: :desc)
                               .paginate(page: params[:page], per_page: 30)
    _index @items
  end

  def show
    _show @item
  end

  def destroy
    _destroy @item
  end

  def destroy_all
    ::Tool::ConvertDoc.in_site(Core.site).delete_all
    redirect_to url_for(:action => :index)
  end

  def export
    csv_string = CSV.generate do |csv|
      csv << [::Tool::ConvertDoc.human_attribute_name(:uri_path),
              ::Tool::ConvertDoc.human_attribute_name(:doc_public_uri),
              ::Tool::ConvertDoc.human_attribute_name(:updated_at),
              ::Tool::ConvertDoc.human_attribute_name(:title),
              "ページ更新日",
              "ページ公開日",
              "ページ作成者グループ",
              "ページカテゴリ",
              "記事作成者グループ",
              "記事カテゴリ"
              ]
      @items = ::Tool::ConvertDoc.in_site(Core.site).order(updated_at: :desc)
      @items.find_each do |item|
        csv << [item.source_uri,
                item.doc_public_uri,
                item.updated_at.try(:strftime, '%Y/%m/%d %H:%M:%S'),
                item.title,
                item.page_updated_at,
                item.page_published_at,
                item.page_group_code,
                item.page_category_names,
                item.docable.creator.try(:group).try(:name),
                item.docable.categories.map(&:title).join(',')]
      end
    end

    send_data csv_string.encode(Encoding::WINDOWS_31J, :invalid => :replace, :undef => :replace),
      type: Rack::Mime.mime_type('.csv'), filename: "export_#{Time.now.strftime('%Y%m%d_%H%M%S')}.csv"
  end
end
