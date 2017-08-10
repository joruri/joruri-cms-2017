class GpCalendar::Public::Piece::CategoryTypesController < GpCalendar::Public::Piece::BaseController
  def pre_dispatch
    @piece = GpCalendar::Piece::CategoryType.find_by(id: Page.current_piece.id)
    return render(:text => '') unless @piece

    @item = Page.current_item
  end

  def index
    @target_node_public_uri = @piece.target_node.try(:public_uri).to_s

    if @target_node_public_uri.blank?
      return render(:text => '') unless %w!GpCalendar::Event
                                           GpCalendar::TodaysEvent
                                           GpCalendar::CalendarStyledEvent!.include?(@item.model)
    end

    @category_types = @piece.content.public_category_types
  end
end
