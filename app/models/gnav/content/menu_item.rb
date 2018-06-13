class Gnav::Content::MenuItem < Cms::Content
  default_scope { where(model: 'Gnav::MenuItem') }

  has_many :settings, foreign_key: :content_id, class_name: 'Gnav::Content::Setting', dependent: :destroy
  has_many :menu_items, -> { order(:sort_no) },
                        foreign_key: :content_id, class_name: 'Gnav::MenuItem', dependent: :destroy

  # node
  has_one :public_node, -> { public_state.where(model: 'Gnav::MenuItem').order(:id) },
                        foreign_key: :content_id, class_name: 'Cms::Node'

  def public_menu_items
    menu_items.where(state: 'public')
  end

  def gp_category_content_category_type
    return @gp_category_content_category_type if defined? @gp_category_content_category_type
    @gp_category_content_category_type = GpCategory::Content::CategoryType.find_by(id: setting_value(:gp_category_content_category_type_id))
  end

  def category_types
    gp_category_content_category_type.try(:category_types) || []
  end
end
