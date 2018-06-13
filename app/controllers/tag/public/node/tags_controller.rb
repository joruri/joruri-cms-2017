class Tag::Public::Node::TagsController < Tag::Public::NodeController
  def pre_dispatch
    @node = Page.current_node
    @content = Tag::Content::Tag.find(Page.current_node.content_id)
  end

  def index
    @items = @content.tags
                     .paginate(page: params[:page], per_page: 50)
    @items = Cms::ContentsPreloader.new(@items).preload(:public_node_ancestors)
    return http_error(404) if @items.current_page > @items.total_pages
  end

  def show
    http_error(404) if params[:page]

    @item = @content.tags.find_by!(word: params[:word])

    Page.current_item = @item
    Page.title = @node.title

    @docs = @item.docs
    @docs = GpArticle::DocsPreloader.new(@docs).preload(:public_node_ancestors)
  end
end
