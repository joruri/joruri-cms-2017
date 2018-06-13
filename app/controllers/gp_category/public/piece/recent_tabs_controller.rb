class GpCategory::Public::Piece::RecentTabsController < GpCategory::Public::PieceController
  def pre_dispatch
    @piece = GpCategory::Piece::RecentTab.find(Page.current_piece.id)
  end

  def index
    @more_label = @piece.more_label.presence || '>>新着記事一覧'
    @tabs = []

    GpCategory::Piece::RecentTabXml.find(:all, @piece, order: :sort_no).each do |tab|
      next if tab.name.blank?

      tab_class =
        if (current = @tabs.empty?)
          "#{tab.name} current"
        else
          tab.name
        end

      content_ids = GpArticle::Content::Setting.where(name: 'gp_category_content_category_type_id',
                                                      value: @piece.content.id).pluck(:content_id)
      docs = GpArticle::Doc.where(content_id: content_ids)
      docs = docs.where(id: tab.doc_ids) if tab.categories_with_layer.present?
      docs = docs.order(display_published_at: :desc, published_at: :desc)
                 .limit(@piece.list_count)

      docs = GpArticle::DocsPreloader.new(docs).preload(:public_node_ancestors)

      @tabs.push(name: tab.name,
                 title: tab.title,
                 class: tab_class,
                 more: tab.more.presence,
                 more_dir: tab.more_dir,
                 current: current,
                 docs: docs)
    end

    render plain: '' if @tabs.empty?
  end
end
