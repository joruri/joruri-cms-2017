class Gnav::Admin::MenuItemsController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    @content = Gnav::Content::MenuItem.find(params[:content])
    return error_auth unless Core.user.has_priv?(:read, item: @content.concept)

    if (gccct = @content.gp_category_content_category_type)
      @category_types = gccct.category_types
      @category_types_for_option = gccct.category_types_for_option
    else
      redirect_to gnav_content_settings_path, alert: 'カテゴリ種別を設定してください。'
    end
  end

  def index
    @items = @content.menu_items.paginate(page: params[:page], per_page: params[:limit])
    _index @items
  end

  def show
    @item = @content.menu_items.find(params[:id])
    _show @item
  end

  def new
    @item = @content.menu_items.build(state: 'public', sort_no: 10)
  end

  def create
    @item = @content.menu_items.build(menu_item_params)
    _create(@item) do
      save_category_sets
    end
  end

  def update
    @item = @content.menu_items.find(params[:id])
    @item.attributes = menu_item_params
    _update(@item) do
      save_category_sets
    end
  end

  def destroy
    @item = @content.menu_items.find(params[:id])
    _destroy @item
  end

  private

  def save_category_sets
    categories = params[:categories]
    layers = params[:layers]

    if categories && layers
      category_set_ids = @item.category_set_ids
      categories.each do |key, value|
        next unless (category = GpCategory::Category.where(id: value).first)
        category_set = @item.category_sets.where(category_id: category.id).first || @item.category_sets.build
        category_set.update_attributes(category: category, layer: layers[key])
        category_set_ids.delete(category_set.id)
      end
      @item.category_sets.find(category_set_ids).each {|cs| cs.destroy }
    end
  end

  def menu_item_params
    params.require(:item).permit(
      :concept_id, :layout_id, :name, :sitemap_state, :sort_no, :state, :title,
      :creator_attributes => [:id, :group_id, :user_id]
    )
  end
end
