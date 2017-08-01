class Rank::Total < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Site
  include Cms::Model::Rel::Content

  # Content
  belongs_to :content, foreign_key: :content_id, class_name: 'Rank::Content::Rank'
  validates :content_id, :presence => true

  def page_title
    self[:page_title].gsub(' | ' + content.site.name, '')
  end
end
