class Cms::Public::Piece::BreadCrumbsController < Cms::Controller::Public::Piece
  def index
    @piece = Page.current_piece
    @item = Page.current_item

    @top_label = @piece.setting_value(:top_label)

    if @item.respond_to?(:bread_crumbs)
      @bread_crumbs = @item.bread_crumbs(Page.current_node)
    else
      @bread_crumbs = Page.current_node.bread_crumbs
    end
  end
end
