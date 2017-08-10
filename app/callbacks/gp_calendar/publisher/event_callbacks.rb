class GpCalendar::Publisher::EventCallbacks < PublisherCallbacks
  def enqueue(event)
    @event = event
    return unless enqueue?
    enqueue_nodes
    enqueue_pieces
  end

  private

  def enqueue_nodes
    changed_dates = [@event.started_on, @event.started_on_was, @event.ended_on, @event.ended_on_was].compact.uniq
    return if changed_dates.blank?

    min_date = changed_dates.min.beginning_of_month
    max_date = changed_dates.max.beginning_of_month

    Cms::Publisher.register(@event.content.site_id, @event.content.public_nodes,
                            target_min_date: min_date.strftime('%Y-%m-%d'),
                            target_max_date: max_date.strftime('%Y-%m-%d'))
  end

  def enqueue_pieces
    Cms::Publisher::PieceCallbacks.new.enqueue(@event.content.public_pieces)
  end
end
