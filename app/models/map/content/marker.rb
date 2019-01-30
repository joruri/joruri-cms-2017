class Map::Content::Marker < Cms::Content
  default_scope { where(model: 'Map::Marker') }

  has_many :settings, foreign_key: :content_id, class_name: 'Map::Content::Setting', dependent: :destroy
  has_many :markers, foreign_key: :content_id, class_name: 'Map::Marker', dependent: :destroy
  has_many :marker_icons, foreign_key: :content_id, class_name: 'Map::MarkerIcon', dependent: :destroy

  # node
  has_one :node, -> { where(model: 'Map::Marker').order(:id) },
                 foreign_key: :content_id, class_name: 'Cms::Node'
  has_one :public_node, -> { public_state.where(model: 'Map::Marker').order(:id) },
                        foreign_key: :content_id, class_name: 'Cms::Node'

  def public_markers
    markers.public_state
  end

  def map_coordinate
    setting_value(:lat_lng)
  end

  def gp_category_content_category_type
    GpCategory::Content::CategoryType.find_by(id: setting_value(:gp_category_content_category_type_id))
  end

  def categories
    setting = Map::Content::Setting.find_by(id: settings.find_by(name: 'gp_category_content_category_type_id').try(:id))
    return GpCategory::Category.none unless setting
    setting.categories
  end

  def public_categories
    categories.public_state
  end

  def category_types
    GpCategory::CategoryType.where(id: categories.map(&:category_type_id))
  end

  def category_types_for_option
    category_types.map {|ct| [ct.title, ct.id] }
  end

  def category_type_categories(category_type)
    category_type_id = (category_type.kind_of?(GpCategory::CategoryType) ? category_type.id : category_type.to_i )
    categories.select {|c| c.category_type_id == category_type_id }
  end

  def category_type_categories_for_option(category_type, include_descendants: true)
    if include_descendants
      category_type_categories(category_type).map{|c| c.descendants_for_option }.flatten(1)
    else
      category_type_categories(category_type).map {|c| [c.title, c.id] }
    end
  end

  def icon_categories_for_option
    marker_icons.where(relatable_type: 'GpCategory::Category').preload(:relatable)
      .select { |icon| icon.relatable.present? }
      .map { |icon| ["#{icon.relatable.title}（#{icon.relatable.category_type.title}） - #{icon.url}", icon.relatable.id] }
  end

  def icon_image(item, goup = false)
    if (icon = marker_icons.where(relatable: item).first)
      icon.url
    else
      if item == GpCategory::Category && goup
        icon_image(item.parent || item.category_type, goup)
      else
        ''
      end
    end
  end

  def list_style
    setting_value(:list_style)
  end

  def default_image
    setting_value(:default_image).to_s
  end

  def sort_markers(markers)
    case setting_value(:marker_order)
    when 'time_asc'
      markers.sort_by { |m| m.created_at }
    when 'time_desc'
      markers.sort_by { |m| m.created_at }.reverse
    when 'sort_no'
      markers.sort_by { |m| [m.sort_no.to_i, m.created_at] }
    when 'category'
      markers.sort do |a, b|
        next  0 if a.categories.empty? && b.categories.empty?
        next -1 if a.categories.empty?
        next  1 if b.categories.empty?
        a.categories.first.unique_sort_key <=> b.categories.first.unique_sort_key
      end
    else
      markers
    end
  end

  def marker_docs
    contents = GpArticle::Content::Doc.arel_table
    content_settings = Cms::ContentSetting.arel_table
    doc_content_ids = GpArticle::Content::Doc.joins(:settings)
                                             .where(contents[:site_id].eq(site_id))
                                             .where(content_settings[:name].eq('map_relation'))
                                             .where(content_settings[:value].eq('enabled'))
                                             .select { |d| d.setting_extra_value(:map_relation, :map_content_id) == id }
                                             .map(&:id)
    if doc_content_ids.blank?
      GpArticle::Doc.none
    else
      docs = GpArticle::Doc.distinct.joins(maps: :markers)
                           .where(content_id: doc_content_ids, marker_state: 'visible')
    end
  end
end
