class GpCategory::Categorization < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Site

  default_scope { order("#{self.table_name}.sort_no IS NULL, #{self.table_name}.sort_no") }

  belongs_to :categorizable, polymorphic: true
  belongs_to :category

  define_site_scope :categorizable
end
