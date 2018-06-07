class GpArticle::Piece::Archive < Cms::Piece
  NUM_DOCS_VISIBILITY_OPTIONS = [['表示する', 'visible'], ['表示しない', 'hidden']]
  TERM_OPTIONS = [['月別', 'month'], ['年・月別', 'year_month'], ['年別', 'year']]
  ORDER_OPTIONS = [['昇順', 'asc'], ['降順', 'desc']]

  default_scope { where(model: 'GpArticle::Archive') }

  belongs_to :content, class_name: 'GpArticle::Content::Doc'

  def num_docs_visibility
    setting_value(:num_docs_visibility).to_s
  end

  def num_docs_visibility_text
    NUM_DOCS_VISIBILITY_OPTIONS.detect{|o| o.last == num_docs_visibility }.try(:first).to_s
  end

  def num_docs_visible?
    num_docs_visibility != 'hidden'
  end

  def term
    setting_value(:term).to_s
  end

  def term_text
    TERM_OPTIONS.detect{|o| o.last == term }.try(:first).to_s
  end

  def order
    setting_value(:order).to_s
  end

  def order_text
    ORDER_OPTIONS.detect{|o| o.last == order }.try(:first).to_s
  end
end
