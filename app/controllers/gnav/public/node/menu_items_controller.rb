class Gnav::Public::Node::MenuItemsController < Gnav::Public::NodeController
  def pre_dispatch
    @content = Gnav::Content::MenuItem.find(Page.current_node.content_id)
  end

  def index
    @menu_items = @content.public_menu_items.paginate(page: params[:page], per_page: 20)
    @menu_items = Cms::ContentsPreloader.new(@menu_items).preload(:public_node_ancestors)
    return http_error(404) if @menu_items.current_page > @menu_items.total_pages
  end

  def show
    http_error(404) if params[:page]

    @menu_item = @content.public_menu_items.find_by!(name: params[:name])

    Page.current_item = @menu_item
    Page.title = @menu_item.title

    @categories = @menu_item.public_categories
    @least_level_no = @categories.min{|a, b| a.level_no <=> b.level_no }.try(:level_no).to_i
    @categories.reject! {|c| c.level_no > (@least_level_no + 1) }
  end
end
