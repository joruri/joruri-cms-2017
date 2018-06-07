class Feed::Public::Node::FeedEntriesController < Feed::Public::NodeController
  include Feed::Controller::Feed

  def pre_dispatch
    @node = Page.current_node
    @content = Feed::Content::Feed.find(@node.content_id)
  end

  def index
    item = @content.public_entries
    @entries = item.paginate(page: params[:page], per_page: (request.mobile? ? 20 : 50))

    return true if render_feed(@entries)
    return http_error(404) if @entries.current_page > @entries.total_pages

    prev   = nil
    @items = []
    @entries.each do |entry|
      next unless entry.entry_updated
      date = entry.entry_updated.strftime('%y%m%d')
      @items << {
        date: (date != prev ? entry.entry_updated.strftime('%Y年%-m月%-d日') : nil),
        entry: entry
      }
      prev = date
    end
  end
end
