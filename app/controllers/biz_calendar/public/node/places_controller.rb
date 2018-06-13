class BizCalendar::Public::Node::PlacesController < BizCalendar::Public::Node::BaseController
  skip_after_action :render_public_layout, only: [:bussiness_times, :bussiness_holidays]

  def index
    http_error(404) if params[:page]

    @places = @content.public_places

    @months = []
    @month_num = @content.month_number

    dt = @today.beginning_of_month
    @months << dt
    1.upto(@month_num-1).each do |i|
      @months << (dt + i.months)
    end
    started = @months.first
    ended   = @months.last

    @weeks    = Hash.new()
    @months.each do |month|
      start_date = month.beginning_of_month.beginning_of_week(:sunday)
      end_date = month.end_of_month.end_of_week(:sunday)

      @weeks["#{month.strftime('%Y%m')}"] = (start_date..end_date).inject([]) do |weeks, day|
          weeks.push([]) if weeks.empty? || day.wday.zero?
          weeks.last.push(day)
          next weeks
        end
    end

    @holidays = Hash.new()
    @repeat_holidays = Hash.new()
    @exception_holidays = Hash.new()
    @places.each do |place|
      criteria = {repeat_type: '', start_year_month: started.strftime('%Y%m'), end_year_month: ended.strftime('%Y%m')}
      @holidays[place.id]           = BizCalendar::BussinessHoliday.public_state.all_with_place_and_criteria(place, criteria).order(:holiday_start_date)
      @exception_holidays[place.id] = BizCalendar::ExceptionHoliday.public_state.all_with_place_and_criteria(place, criteria).order(:start_date)

      criteria[:repeat_type] = 'not_null'
      @repeat_holidays[place.id] = BizCalendar::BussinessHoliday.public_state.all_with_place_and_criteria(place, criteria).order(:holiday_start_date)
    end
  end

  def show
    @place = @content.public_places.find_by!(url: params[:name])

    Page.current_item = @place
    Page.title = "#{@place.title}"

    @months = []
    @month_num = @content.show_month_number

    dt = @today.beginning_of_month
    @months << dt
    1.upto(@month_num-1).each do |i|
      @months << (dt + i.months)
    end
    started = @months.first
    ended   = @months.last

    @weeks    = Hash.new()
    @months.each do |month|
      start_date = month.beginning_of_month.beginning_of_week(:sunday)
      end_date = month.end_of_month.end_of_week(:sunday)

      @weeks["#{month.strftime('%Y%m')}"] = (start_date..end_date).inject([]) do |weeks, day|
          weeks.push([]) if weeks.empty? || day.wday.zero?
          weeks.last.push(day)
          next weeks
        end
    end

    @holidays = Hash.new()
    @repeat_holidays = Hash.new()
    @exception_holidays = Hash.new()
    
    criteria = {repeat_type: '', start_year_month: started.strftime('%Y%m'), end_year_month: ended.strftime('%Y%m')}
    @holidays[@place.id]           = BizCalendar::BussinessHoliday.public_state.all_with_place_and_criteria(@place, criteria).order(:holiday_start_date)
    @exception_holidays[@place.id] = BizCalendar::ExceptionHoliday.public_state.all_with_place_and_criteria(@place, criteria).order(:start_date)

    criteria[:repeat_type] = 'not_null'
    @repeat_holidays[@place.id] = BizCalendar::BussinessHoliday.public_state.all_with_place_and_criteria(@place, criteria).order(:holiday_start_date)
  end


  def bussiness_times
    @piece = BizCalendar::Piece::BussinessTime.find(params[:piece])

    @places = @content.public_places
    
    if params[:name].present?
      place = @content.public_places.find_by!(url: params[:name])
      @places = [place]
    end

    today = Date.today

    if @piece.target_today?
      @bussiness_times    = Hash.new()
      @holidays           = Hash.new()
      @exception_holidays = Hash.new()
      @repeat_holidays    = Hash.new()

      @places.each do |place|
        @bussiness_times[place.id] = place.get_bussines_time(today)

        criteria = {repeat_type: '', start_date: today, end_date: today}
        @exception_holidays[place.id] = BizCalendar::ExceptionHoliday.public_state.all_with_place_and_criteria(place, criteria).order(:start_date)
        holidays = BizCalendar::BussinessHoliday.public_state.all_with_place_and_criteria(place, criteria).order(:holiday_start_date)

        @holidays[place.id] = Hash.new()
        holidays.each{ |h| @holidays[place.id][h.type.id] = [h.type.name, h.type.title] }

        criteria[:repeat_type] = 'not_null'
        repeat_holidays = BizCalendar::BussinessHoliday.public_state.all_with_place_and_criteria(place, criteria)
        repeat_holidays.each{ |h| @holidays[place.id][h.type.id] = [h.type.name, h.type.title] if h.check(today) }

        @holidays[place.id] = @holidays[place.id].sort
      end
    end

  rescue
    return http_error(404)
  end

  def bussiness_holidays
    @piece = BizCalendar::Piece::BussinessHoliday.find(params[:piece])
    return http_error(404) unless @piece.target_next?

    @places = @content.public_places

    if params[:name].present?
      place = @content.public_places.find_by!(url: params[:name])
      @places = [place]
    end

    today = Date.today

    @next_holiday       = Hash.new()

    @holidays           = Hash.new()
    @exception_holidays = Hash.new()
    @repeat_holidays    = Hash.new()

    @places.each do |place|
      @next_holiday[place.id] = false

#      sdate=Date.today
#      place.holidays.public.each do |h|
#        if h.repeat_type.blank?
#          next if h.holiday_end_date < sdate
#        elsif !h.repeat_type.blank? && h.end_type == 2
#          next if !h.end_date.blank? && h.end_date < sdate
#        end
#      end
#
#
      if h = place.next_holiday
        @next_holiday[place.id] = h
      end
    end

  rescue
    return http_error(404)
  end

end
