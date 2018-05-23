class GpArticle::Public::Node::ArchivesController < GpArticle::Public::NodeController
  def pre_dispatch
    @content = GpArticle::Content::Doc.find(Page.current_node.content_id)
    return http_error(404) unless validate_date
  end

  def index
    if @month
      started_at = Time.new(@year, @month, 1).beginning_of_day
      ended_at = started_at.end_of_month.end_of_day
    else
      started_at = Time.new(@year, 1, 1).beginning_of_day
      ended_at = started_at.end_of_year.end_of_day
    end

    @docs = @content.docs_for_list
                    .date_between(@content.docs_order_column, started_at, ended_at)
                    .order(@content.docs_order_as_hash)

    if @docs.empty?
      warn_log 'No archived docs'
      http_error(404)
    end

    header_format = @month ? '%Y年%-m月' : '%Y年'
    @items = @docs.group_by { |doc| doc[@content.docs_order_column].try(:strftime, header_format) }
  end

  private

  def validate_date
    @month = params[:month].to_i
    if @month.zero?
      @month = nil
    else
      return false unless @month.between?(1, 12)
    end

    @year = params[:year].to_i
    @year = Date.today.year if @year.zero?
    return false unless @year.between?(1900, 2100)

    return true
  end
end
