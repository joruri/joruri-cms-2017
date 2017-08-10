class Cms::Map < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Site

  belongs_to :map_attachable, polymorphic: true
  has_many :markers, foreign_key: :map_id, class_name: 'Cms::MapMarker', dependent: :destroy
  accepts_nested_attributes_for :markers

  define_site_scope :map_attachable
end
