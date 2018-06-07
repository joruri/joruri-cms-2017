class AdBanner::Content::Banner < Cms::Content
  default_scope { where(model: 'AdBanner::Banner') }

  has_many :settings, foreign_key: :content_id, class_name: 'AdBanner::Content::Setting', dependent: :destroy
  has_many :banners, foreign_key: :content_id, class_name: 'AdBanner::Banner', dependent: :destroy
  has_many :groups, foreign_key: :content_id, class_name: 'AdBanner::Group', dependent: :destroy

  # node
  has_one :public_node, -> { public_state.where(model: 'AdBanner::Banner').order(:id) },
                        foreign_key: :content_id, class_name: 'Cms::Node'

  def groups_for_option
    groups.map {|g| [g.title, g.id] }
  end

  def click_count_related?
    setting_value(:click_count_setting) != 'disabled'
  end

  def image_display
    setting_value(:image_display)
  end
end
