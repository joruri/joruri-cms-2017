class BizCalendar::ExceptionHoliday < ApplicationRecord
  include Sys::Model::Base
  include Sys::Model::Rel::Creator
  include Cms::Model::Site
  include Cms::Model::Auth::Content

  include StateText

  STATE_OPTIONS = [['公開', 'public'], ['非公開', 'closed']]

  belongs_to :place,  :foreign_key => :place_id, :class_name => 'BizCalendar::Place'

  delegate :content, to: :place

  validates :state, :start_date, :end_date, presence: true
  validate :dates_range
  
  after_initialize :set_defaults

  after_save     Cms::Publisher::ContentCallbacks.new(belonged: true), if: :changed?
  before_destroy Cms::Publisher::ContentCallbacks.new(belonged: true)

  define_site_scope :place

  scope :public_state, ->{ where(state: 'public') }
  scope :search_with_params, ->(params = {}) {
    rel = all
    params.each do |n, v|
      next if v.to_s == ''
      case n
      when 's_event_date'
        rel.where!(event_date: v)
      when 's_title'
        rel = rel.search_with_text(:title, v)
      end
    end
    rel
  }

  def self.all_with_place_and_criteria(place, criteria)
    holidays = self.arel_table

    rel = self.where(holidays[:place_id].eq(place.id))

    start_date = false
    end_date   = false
    if (s_ym = criteria[:start_year_month]) =~ /^(\d{6})$/ && (e_ym = criteria[:end_year_month]) =~ /^(\d{6})$/
      start_date = Date.new(s_ym.slice(0, 4).to_i, s_ym.slice(4, 2).to_i, 1)
      end_date = Date.new(e_ym.slice(0, 4).to_i, e_ym.slice(4, 2).to_i, 1)
      end_date = end_date.end_of_month
    end
    if criteria[:start_date].present? && criteria[:end_date].present?
      start_date = criteria[:start_date]
      end_date = criteria[:end_date]
    end
    if start_date && end_date
      rel = rel.where(holidays[:start_date].lteq(end_date)
                      .and(holidays[:end_date].gteq(start_date)))
    end

    rel = case criteria[:order]
          when 'created_at_desc'
            rel.except(:order).order(holidays[:created_at].desc)
          when 'created_at_asc'
            rel.except(:order).order(holidays[:created_at].asc)
          else
            rel
          end

    return rel
  end

  def state_public?
    state == 'public'
  end

  def dates_range
    return if self.start_date.blank? && self.end_date.blank?
    self.start_date = self.end_date if self.start_date.blank?
    self.end_date = self.start_date if self.end_date.blank?
    errors.add(:end_date, "が#{self.class.human_attribute_name :start_date}を過ぎています。") if self.end_date < self.start_date
  end

  def set_defaults
    self.state ||= STATE_OPTIONS.first.last if self.has_attribute?(:state)
  end
end
