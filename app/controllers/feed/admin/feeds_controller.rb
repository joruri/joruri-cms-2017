class Feed::Admin::FeedsController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    @content = Feed::Content::Feed.find(params[:content])
    return error_auth unless Core.user.has_priv?(:read, item: @content.concept)
  end

  def index
    items = @content.feeds.except(:order).order(created_at: :desc)
    @items = items.paginate(page: params[:page], per_page: params[:limit])
    
    _index @items
  end

  def show
    @item = @content.feeds.find(params[:id])
    _show @item
  end

  def new
    @item = @content.feeds.build
  end

  def create
    @item = Feed::Feed.new(feed_params)
    @item.content_id = @content.id

    _create @item
  end

  def update
    @item = Feed::Feed.find(params[:id])
    @item.attributes = feed_params

    _update(@item)
  end

  def destroy
    @item = Feed::Feed.find(params[:id])
    _destroy @item
  end

  private

  def feed_params
    params.require(:item).permit(
      :state, :name, :title, :uri, :entry_count,
      :creator_attributes => [:id, :group_id, :user_id]
    )
  end
end
