class GpCalendar::Admin::Piece::BaseController < Cms::Admin::Piece::BaseController
  def update
    item_in_settings = (params[:item][:in_settings] || {})

    item_in_settings[:target_node_id] = params[:target_node]

    params[:item][:in_settings] = item_in_settings
    super
  end
end
