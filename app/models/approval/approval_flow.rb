class Approval::ApprovalFlow < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Site
  include Cms::Model::Rel::Content
  include Cms::Model::Auth::Content

  # Content
  belongs_to :content, :foreign_key => :content_id, :class_name => 'Approval::Content::ApprovalFlow'
  validates :content_id, presence: true

  belongs_to :group, :class_name => 'Sys::Group'

  has_many :approvals, :dependent => :destroy
  has_many :approval_requests, :dependent => :destroy

  after_initialize :set_defaults

  validates :title, :presence => true

  private

  def set_defaults
    self.sort_no ||= 10 if self.has_attribute?(:sort_no)
  end
end
