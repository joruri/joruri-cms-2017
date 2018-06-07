class GpArticle::Piece::Doc < Cms::Piece
  DOCS_ORDER_OPTIONS = [['公開日（降順）', 'published_at_desc'], ['公開日（昇順）', 'published_at_asc'],
                        ['更新日（降順）', 'updated_at_desc'], ['更新日（昇順）', 'updated_at_asc'],
                        ['ランダム', 'random']]

  default_scope { where(model: 'GpArticle::Doc') }

  belongs_to :content, class_name: 'GpArticle::Content::Doc'

  after_initialize :set_default_settings

  validate :validate_settings

  def validate_settings
    if (lc = in_settings['docs_number']).present?
      errors.add(:base, "#{self.class.human_attribute_name :docs_number} #{errors.generate_message(:base, :not_a_number)}") unless lc =~ /^[0-9]+$/
    end
  end

  def docs_number
    (setting_value(:docs_number).presence || 1000).to_i
  end

  def docs_order
    setting_value(:docs_order).to_s
  end

  def docs_order_as_sql
    map = {
      'published_at_desc' => { display_published_at: :desc, published_at: :desc },
      'published_at_asc' => { display_published_at: :asc, published_at: :asc },
      'updated_at_desc' => { display_updated_at: :desc, updated_at: :desc },
      'updated_at_asc' => { display_updated_at: :asc, updated_at: :asc },
      'random' => 'RANDOM()'
    }
    map[docs_order] || map['published_at_desc']
  end

  def doc_style
    setting_value(:doc_style).to_s
  end

  def date_style
    setting_value(:date_style).to_s
  end

  def more_link_body
    setting_value(:more_link_body).to_s
  end

  def more_link_url
    setting_value(:more_link_url).to_s
  end

  private

  def set_default_settings
    settings = self.in_settings

    settings['date_style'] = '%Y年%m月%d日 %H時%M分' if setting_value(:date_style).nil?
    settings['docs_order'] = DOCS_ORDER_OPTIONS.first.last if setting_value(:docs_order).nil?

    self.in_settings = settings
  end
end
