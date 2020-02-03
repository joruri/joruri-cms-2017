class Gnav::Piece::Doc < Cms::Piece
  default_scope { where(model: 'Gnav::Doc') }

  belongs_to :content, class_name: 'Gnav::Content::MenuItem'

  after_initialize :set_default_settings

  validate :validate_settings

  def validate_settings
    if (lc = in_settings['list_count']).present?
      errors.add(:base, "#{self.class.human_attribute_name :list_count} #{errors.generate_message(:base, :not_a_number)}") unless lc =~ /^[0-9]+$/
    end
  end

  def list_count
    (setting_value(:list_count).presence || 1000).to_i
  end

  def list_style
    setting_value(:list_style).to_s
  end

  def date_style
    setting_value(:date_style).to_s
  end

  def category_types
    content.category_types
  end

  def category_types_for_option
    category_types.map {|ct| [ct.title, ct.id] }
  end

  def category_type
    return @category_type if defined? @category_type
    @category_type = category_types.find_by(id: setting_value(:category_type_id))
  end

  def categories
    unless category_type
      return category_types.inject([]) {|result, ct|
        ct = GpCategory::CategoryTypesPreloader.new(ct).preload(:root_categories_and_descendants)
        result | ct.root_categories.inject([]) {|r, c| r | c.descendants }
      }
    end

    if (category_id = setting_value(:category_id)).present?
      category_type.categories.where(id: category_id).to_a
    else
      ct = GpCategory::CategoryTypesPreloader.new(category_type).preload(:root_categories_and_descendants)
      ct.root_categories.inject([]) {|r, c| r | c.descendants }
    end
  end

  def category
    return nil if categories.empty?

    if categories.respond_to?(:find_by_id)
      categories.find_by(id: setting_value(:category_id))
    else
      categories.detect {|c| c.id.to_s == setting_value(:category_id) }
    end
  end

  private

  def set_default_settings
    in_settings['list_style'] = '@title_link@(@publish_date@ @group@)' if setting_value(:list_style).nil?
    in_settings['date_style'] = '%Y年%m月%d日 %H時%M分' if setting_value(:date_style).nil?
  end
end
