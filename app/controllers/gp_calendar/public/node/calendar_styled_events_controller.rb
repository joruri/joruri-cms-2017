class GpCalendar::Public::Node::CalendarStyledEventsController < GpCalendar::Public::NodeController
  def index
    http_error(404) if params[:page]

    start_date = @date.beginning_of_month.beginning_of_week(:sunday)
    end_date = @date.end_of_month.end_of_week(:sunday)
    @range = [start_date, end_date]

    @weeks = (start_date..end_date).inject([]) do |weeks, day|
        weeks.push([]) if weeks.empty? || day.wday.zero?
        weeks.last.push(day)
        next weeks
      end

    events = @content.public_events.scheduled_between(start_date, end_date)
    events = events.categorized_into(@specified_category.public_descendants) if @specified_category
    events = events.preload(:categories, :periods)

    docs = @content.event_docs.scheduled_between(start_date, end_date)
    docs = docs.categorized_into(@specified_category.public_descendants, categorized_as: 'GpCalendar::Event') if @specified_category
    docs = docs.preload(:periods)

    @events = GpCalendar::EventMergeService.new(@content).merge(events, docs, @range)

    @holidays = @content.public_holidays.scheduled_between(start_date, end_date)
  end
end
