require 'will_paginate/array'
class GpArticle::Public::Node::SearchDocsController < GpArticle::Public::NodeController
  def pre_dispatch
    @content = GpArticle::Content::Doc.find(Page.current_node.content_id)
  end

  def index
    @keyword = params.dig(:criteria, :keyword)
    @category_ids = params.dig(:criteria, :category_ids) || []

    @docs = @content.docs
    @docs = @docs.search_with_text(:title, :body, @keyword) if @keyword.present?
    @docs = @docs.categorized_into(@category_ids) if @category_ids.present?
    @docs = @docs.order(@content.docs_order_as_hash)
                 .paginate(page: params[:page], per_page: 20)

    @docs = GpArticle::DocsPreloader.new(@docs).preload(:public_node_ancestors)
    return http_error(404) if @docs.current_page > @docs.total_pages
  end
end
