class GpArticle::Hold < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Site

  belongs_to :holdable, polymorphic: true
  belongs_to :user, class_name: 'Sys::User'

  define_site_scope :holdable

  def group_and_user_name
    return '' unless user
    "#{user.group.try!(:name)}#{user.name}"
  end

  def formatted_updated_at
    format = updated_at.today? ? :short_ja : :default_ja
    I18n.l(updated_at, format: format)
  end
end
