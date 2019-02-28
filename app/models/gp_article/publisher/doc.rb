class GpArticle::Publisher::Doc < Cms::Publisher
  default_scope { where(publishable_type: 'GpArticle::Doc') }

  class << self
    def perform_publish(publishers)
      pub_ids = publishers.map(&:id)
      publishers = self.where(id: pub_ids).preload(publishable: { content: :public_nodes })

      node_map = make_node_map(publishers)
      node_map.each do |node, pubs|
        ::Script.run("gp_article/docs/publish",
          site_id: pubs.first.site_id,
          node_id: node.id,
          target_doc_id: pubs.map(&:publishable_id)
        )
      end
    end

    private

    def make_node_map(publishers)
      node_map = {}
      publishers.each do |pub|
        if (doc = pub.publishable) && doc.content
          nodes = doc.content.public_nodes.select { |node| node.model == 'GpArticle::Doc' }
          nodes.each do |node|
            node_map[node] ||= []
            node_map[node] << pub
          end
        end
      end
      node_map
    end
  end
end
