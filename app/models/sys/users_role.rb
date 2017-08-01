class Sys::UsersRole < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Site
  include Cms::Model::Auth::Site::User

  belongs_to :user, :foreign_key => :user_id, :class_name => 'Sys::User'
  belongs_to :role_name, :foreign_key => :role_id, :class_name => 'Sys::RoleName'

  define_site_scope :role_name
end
