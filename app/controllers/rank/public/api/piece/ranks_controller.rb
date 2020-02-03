class Rank::Public::Api::Piece::RanksController < Cms::Controller::Public::Api
  def pre_dispatch
    return http_error(405) unless request.get?
    return http_error(404) unless params[:version] == '20150401'
  end

  def index
    piece = Rank::Piece::Rank.where(id: params[:piece_id]).first
    return render(json: {}) unless piece

    current_item = rank_current_item(params[:current_item_class], params[:current_item_id])

    ranks = Rank::TotalsFinder.new(piece.content.ranks)
                              .search(piece.content, piece.ranking_term, piece.ranking_target, category_option: piece.category_option, current_item: current_item)
                              .paginate(page: params[:page], per_page: piece.display_count)

    result = {}
    result[:ranks] = ranks.map do |rank|
                         {title: rank.page_title,
                            url: "#{request.scheme}://#{rank.hostname}#{rank.page_path}",
                          count: piece.show_count == 0 ? nil : rank.accesses}
                       end
    result[:more] = if (body = piece.more_link_body).present? && (url = piece.more_link_url).present?
                      {body: body, url: url}
                    end

    render json: result
  end

  private

  def rank_current_item(current_item_class, current_item_id)
    if current_item_class.in?(%w(GpCategory::CategoryType GpCategory::Category))
      current_item_class.constantize.find_by(id: current_item_id)
    else
      nil
    end
  end
end
