class GpCategory::Public::Piece::CategoriesController < GpCategory::Public::PieceController
  def pre_dispatch
    @piece = GpCategory::Piece::Category.find(Page.current_piece.id)
    return render plain: '' unless @piece.category_type
  end

  def index
    @root_categories = @piece.category_type.public_root_categories
    @root_categories = GpCategory::CategoriesPreloader.new(@root_categories).preload(:public_descendants_and_public_node_ancestors)
    return render plain: '' if @root_categories.empty?

    categories = GpCategory::Category.arel_table
    @doc_count = GpArticle::Doc.joins(:categories)
                               .where(categories[:category_type_id].eq(@piece.category_type.id))
                               .group(categories[:id])
                               .count
  end
end
