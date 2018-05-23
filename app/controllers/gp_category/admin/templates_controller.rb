class GpCategory::Admin::TemplatesController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    @content = GpCategory::Content::CategoryType.find(params[:content])
    return error_auth unless Core.user.has_priv?(:read, item: @content.concept)
    @item = @content.templates.find(params[:id]) if params[:id].present?
  end

  def index
    @items = @content.templates.paginate(page: params[:page], per_page: params[:limit])
    _index @items
  end

  def show
  end

  def new
    @item = @content.templates.build
  end

  def create
    @item = @content.templates.build(template_params)
    _create @item
  end

  def edit
  end

  def update
    @item.attributes = template_params
    _update @item
  end

  def destroy
    _destroy @item
  end

  private

  def template_params
    params.require(:item).permit(:body, :name, :title)
  end
end
