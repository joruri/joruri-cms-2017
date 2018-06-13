class Reception::Content::Course < Cms::Content
  default_scope { where(model: 'Reception::Course') }

  has_many :settings, foreign_key: :content_id, class_name: 'Reception::Content::Setting', dependent: :destroy
  has_many :courses, foreign_key: :content_id, class_name: 'Reception::Course', dependent: :destroy

  # node
  has_one :public_node, -> { public_state.where(model: 'Reception::Course').order(:id) },
                        foreign_key: :content_id, class_name: 'Cms::Node'

  def public_path
    site.public_path
  end

  def public_courses
    courses.public_state
  end

  def gp_category_content_category_type
    GpCategory::Content::CategoryType.find_by(id: setting_value(:gp_category_content_category_type_id))
  end

  def category_types
    setting = Reception::Content::Setting.find_by(id: settings.find_by(name: 'gp_category_content_category_type_id').try(:id))
    if (cts = gp_category_content_category_type.try(:category_types))
      cts.where(id: setting.try(:category_type_ids))
    else
      GpCategory::CategoryType.none
    end
  end

  def category_types_for_option
    category_types.map {|ct| [ct.title, ct.id] }
  end

  def pubilc_category_types
    category_types.where(state: 'public')
  end

  def visible_category_types
    setting = Reception::Content::Setting.find_by(id: settings.find_by(name:  'gp_category_content_category_type_id').try(:id))
    if (cts = gp_category_content_category_type.try(:category_types))
      cts.where(id: setting.try(:visible_category_type_ids))
    else
      GpCategory::CategoryType.none
    end
  end

  def default_category_type
    setting = Reception::Content::Setting.find_by(id: settings.find_by(name: 'gp_category_content_category_type_id').try(:id))
    GpCategory::CategoryType.find_by(id: setting.try(:default_category_type_id))
  end

  def default_category
    setting = Reception::Content::Setting.find_by(id: settings.find_by(name: 'gp_category_content_category_type_id').try(:id))
    GpCategory::Category.find_by(id: setting.try(:default_category_id))
  end

  def mail_from
    setting_value(:mail_from).to_s
  end

  def mail_to
    setting_value(:mail_to).to_s
  end

  def auto_reply?
    setting_value(:auto_reply) == 'send'
  end

  def applied_upper_reply_text
    setting_extra_value(:auto_reply, :applied_upper_reply_text).to_s
  end

  def applied_lower_reply_text
    setting_extra_value(:auto_reply, :applied_lower_reply_text).to_s
  end

  def received_upper_reply_text
    setting_extra_value(:auto_reply, :received_upper_reply_text).to_s
  end

  def received_lower_reply_text
    setting_extra_value(:auto_reply, :received_lower_reply_text).to_s
  end

  def canceled_upper_reply_text
    setting_extra_value(:auto_reply, :canceled_upper_reply_text).to_s
  end

  def canceled_lower_reply_text
    setting_extra_value(:auto_reply, :canceled_lower_reply_text).to_s
  end

  def doc_list_style
    setting_value(:doc_list_style).to_s
  end

  def attachment_embed_link
    true
  end
end
