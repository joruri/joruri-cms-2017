class GpCategory::Public::Piece::DocsController < GpCategory::Public::PieceController
  def pre_dispatch
    @piece = GpCategory::Piece::Doc.find(Page.current_piece.id)
    @item = Page.current_item
  end

  def index
    if (piece_categories = @piece.categories).empty?
      conditions = {name: 'gp_category_content_category_type_id', value: @piece.content.id}
      gacds = @piece.gp_article_content_docs
      conditions[:content_id] = gacds.map(&:id) unless gacds.empty?

      contents = Cms::Content.arel_table
      gp_article_content_docs = Cms::ContentSetting.joins(:content)
                                                   .where(contents[:model].eq('GpArticle::Doc'))
                                                   .where(conditions).map(&:content)
      piece_doc_ids = find_doc_ids_with_content_ids(gp_article_content_docs.map(&:id))
    else
      piece_doc_ids = unless (gacds = @piece.gp_article_content_docs).empty?
                        find_doc_ids_with_content_ids_and_category_ids(gacds.map(&:id), piece_categories.map(&:id))
                      else
                        find_doc_ids_with_category_ids(piece_categories.map(&:id))
                      end
    end

    unless @piece.page_filter == 'through'
      case @item
      when GpCategory::CategoryType
        page_category_ids = @item.categories.map(&:id)
      when GpCategory::Category
        page_category_ids = @item.descendants.map(&:id)
      end
    end

    if page_category_ids
      page_doc_ids = find_doc_ids_with_category_ids(page_category_ids)
      doc_ids = piece_doc_ids & page_doc_ids
    else
      doc_ids = piece_doc_ids
    end

    @docs = GpArticle::Doc.where(id: doc_ids).limit(@piece.list_count)
    @docs = case @piece.docs_order
            when 'published_at_desc'
              @docs.order(display_published_at: :desc, published_at: :desc)
            when 'published_at_asc'
              @docs.order(display_published_at: :asc, published_at: :asc)
            when 'updated_at_desc'
              @docs.order(display_updated_at: :desc, updated_at: :desc)
            when 'updated_at_asc'
              @docs.order(display_updated_at: :asc, updated_at: :asc)
            when 'random'
              @docs.order(Arel.sql('RANDOM()'))
            else
              @docs
            end

    @docs = GpArticle::DocsPreloader.new(@docs).preload(:public_node_ancestors)
  end

  private

  def find_doc_ids_with_content_ids(content_ids)
    GpArticle::Doc.where(content_id: content_ids).pluck(:id)
  end

  def find_doc_ids_with_content_ids_and_category_ids(content_ids, category_ids)
    categorizations = GpCategory::Categorization.arel_table
    GpArticle::Doc.where(content_id: content_ids)
                  .joins(:categorizations).where(categorizations[:category_id].in(category_ids)).pluck(:id)
  end

  def find_doc_ids_with_category_ids(category_ids)
    categorizations = GpCategory::Categorization.arel_table
    GpArticle::Doc.joins(:categorizations).where(categorizations[:category_id].in(category_ids)).pluck(:id)
  end
end
