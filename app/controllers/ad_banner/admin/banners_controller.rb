class AdBanner::Admin::BannersController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    @content = AdBanner::Content::Banner.find(params[:content])
    return error_auth unless Core.user.has_priv?(:read, item: @content.concept)
  end

  def index
    items = @content.banners.except(:order).order(sort_no: :asc, created_at: :desc)

    items = case params[:target]
            when 'published'
              items.published
            when 'closed'
              items.closed
            else
              items
            end

    @items = items.paginate(page: params[:page], per_page: params[:limit])

    _index @items
  end

  def show
    @item = @content.banners.find(params[:id])
    _show @item
  end

  def new
    @item = @content.banners.build(site_id: Core.site.id)
  end

  def create
    @item = @content.banners.build(banner_params)
    @item.site_id = Core.site.id
    _create @item
  end

  def update
    @item = @content.banners.find(params[:id])
    @item.attributes = banner_params
    @item.skip_upload if @item.file.blank? && ::File.exist?(@item.upload_path)
    _update @item
  end

  def destroy
    @item = @content.banners.find(params[:id])
    _destroy @item
  end

  def file_content
    item = @content.banners.find(params[:id])
    send_file item.upload_path, filename: item.name
  end

  private

  def banner_params
    params.require(:item).permit(
      :advertiser_contact, :advertiser_email, :advertiser_name, :advertiser_phone,
      :closed_at, :file, :group_id, :name, :published_at, :sort_no, :state, :title, :alt_text, :url, :sp_url, :target,
      :creator_attributes => [:id, :group_id, :user_id]
    )
  end
end
