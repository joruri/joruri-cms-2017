class Cms::SiteBasicAuthUser < ApplicationRecord
  include Sys::Model::Base
  include Sys::Model::Base::Config
  include Sys::Model::Rel::Creator
  include Cms::Model::Site
  include Cms::Model::Rel::Site
  include Cms::Model::Auth::Site

  include StateText

  TARGET_TYPE_LIST = [['サイト全体','all'],['管理画面','_system'],['ディレクトリ','directory']]

  after_initialize :set_defaults

  validates :site_id, :state, :name, :password, presence: true
  validates :target_location, presence: true,
                              format: { with: /\A[0-9A-Za-z@\.\-_\+\s\/]+\z/, message: :not_a_filename },
                              if: -> { is_directory? }

  scope :all_location, -> { where(target_type: 'all') }
  scope :system_location, -> { where(target_type: '_system') }
  scope :directory_location, -> { where(target_type: 'directory') }
  scope :enabled, -> { where(state: 'enabled') }

  def target_type_label
    TARGET_TYPE_LIST.each{|a| return a[0] if a[1] == target_type }
    return nil
  end

  def is_directory?
    target_type == 'directory'
  end

  private

  def set_defaults
    self.target_type    ||= TARGET_TYPE_LIST.first.last if self.has_attribute?(:target_type)
  end
end
