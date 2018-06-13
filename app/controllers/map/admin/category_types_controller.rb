class Map::Admin::CategoryTypesController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  before_action :get_item_and_setting, only: [:edit, :update]

  def pre_dispatch
    @content = Map::Content::Marker.find(params[:content])
    return error_auth unless Core.user.has_priv?(:read, item: @content.concept)
  end

  def index
    @items = @content.category_types.paginate(page: params[:page], per_page: params[:limit])
  end

  def edit
  end

  def update
    @icon.attributes = icon_params
    _update @icon
  end

  private

  def get_item_and_setting
    @item = @content.category_types.find(params[:id])
    @icon = @content.marker_icons.where(relatable: @item).first_or_initialize
  end

  def icon_params
    params.require(:item).permit(:url)
  end
end
