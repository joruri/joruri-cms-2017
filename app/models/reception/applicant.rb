class Reception::Applicant < ApplicationRecord
  include Sys::Model::Base
  include Sys::Model::Rel::Creator
  include Cms::Model::Site
  include Cms::Model::Auth::Content

  STATE_OPTIONS = [['申込','applied'],['受付','received'],['キャンセル','canceled']]
  APPLIED_FROM_OPTIONS = [['フォーム','public'],['登録','admin']]

  attr_accessor :email_confirmation
  attr_accessor :in_register_from_admin, :in_register_from_public
  has_secure_token :token

  belongs_to :open
  has_one :applicant_token, dependent: :destroy

  delegate :course, to: :open
  delegate :content, to: :course

  before_save :set_applied_at

  with_options unless: :temporary_state? do
    before_save :set_seq_no
    after_save :update_received_applicants_count
    after_save :update_applicant_token
  end

  validates :open_id, presence: true
  validates :state, presence: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :tel, presence: true
  validates :email, presence: { if: :in_register_from_public },
                    format: { with: /\A.+@.+\z/, if: -> { email.present? } },
                    confirmation: true 
  validates :applied_from, presence: true
  validate :validate_capacity_for_admin, if: :in_register_from_admin
  validate :validate_capacity_for_public, if: :in_register_from_public

  define_site_scope :open

  scope :received_state, -> { where(state: 'received') }
  scope :canceled_state, -> { where(state: 'canceled') }
  scope :search_with_criteria, ->(criteria) {
    criteria ||= {}
    rel = all
    [:state].each do |key|
      rel = rel.where(key => criteria[key]) if criteria[key].present?
    end
    rel
  }

  def state_text
    STATE_OPTIONS.rassoc(state).try(:first)
  end

  def applied_from_text
    APPLIED_FROM_OPTIONS.rassoc(applied_from).try(:first)
  end

  def temporary_state?
    state.in?(%w(tmp_applied tmp_canceled))
  end

  private

  def validate_capacity_for_admin
    if changes.dig(:state, 1) == 'received' && !open.within_capacity?
      errors.add(:base, '定員を超過したため受付できません。')
    end
  end

  def validate_capacity_for_public
    if open && !open.within_capacity?
      errors.add(:base, 'ご指定の参加日は定員を超過したためお申込できません。')
    end
  end

  def set_applied_at
    self.applied_at ||= Time.now
  end

  def set_seq_no
    self.seq_no ||= Util::Sequencer.next_id('reception_applicants', version: course.content_id, site_id: content.site_id)
  end

  def update_received_applicants_count
    open.update_received_applicants_count
  end

  def update_applicant_token
    token = applicant_token || build_applicant_token
    token.attributes = attributes.slice('open_id', 'state', 'seq_no', 'token')
    token.save
  end
end
