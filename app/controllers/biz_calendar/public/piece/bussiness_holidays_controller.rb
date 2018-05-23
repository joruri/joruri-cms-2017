class BizCalendar::Public::Piece::BussinessHolidaysController < BizCalendar::Public::PieceController
  def pre_dispatch
    @piece = BizCalendar::Piece::BussinessHoliday.find(Page.current_piece.id)
    @item = Page.current_item
  end

  def index
    node = @piece.content.public_nodes.first!

    start_date = Date.today
    end_date   = (Date.today >> 12).end_of_month

    @start_date = start_date
    @end_date = end_date
    @places = @piece.content.public_places
    
    unless @piece.page_filter == 'through'
      if @item.class.to_s == "BizCalendar::Place"
        @place_name = @item.url
        @places = [@item]
      end
    end

    unless @piece.target_next?
      @holidays           = Hash.new()
      @exception_holidays = Hash.new()
      @repeat_holidays    = Hash.new()

      @places.each do |place|
        @holidays[place.id] = Hash.new()
        holidays = []
        place.holidays.public_state.each do |h|
          if h.enable_holiday?(start_date, end_date)
            holidays << h
          end
        end

        holidays.each do |hh|
          n = hh.type ? hh.type.id : ''
          unless @holidays[place.id].member?(n)
            @holidays[place.id][n] = Hash.new()
            @holidays[place.id][n][:type] = hh.type ? hh.type : nil
            @holidays[place.id][n][:holidays] = []
          end
          @holidays[place.id][n][:holidays] << hh
        end
      end
      
    end

    @biz_calendar_node_uri = node.public_uri
  end
end
