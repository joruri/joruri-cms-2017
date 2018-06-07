class GpCategory::Public::Piece::CategoryTypesController < GpCategory::Public::PieceController
  def pre_dispatch
    @piece = GpCategory::Piece::CategoryType.find(Page.current_piece.id)
    @item = Page.current_item
  end

  def index
    case @item
    when GpCategory::CategoryType
      @category_type = @item
      render :category_type
    when GpCategory::Category
      @category = @item
      render :category
    else
      @category_types = @piece.public_category_types
    end
  end
end
