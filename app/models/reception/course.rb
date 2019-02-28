class Reception::Course < ApplicationRecord
  include Sys::Model::Base
  include Sys::Model::Rel::Creator
  include Sys::Model::Rel::File
  include Cms::Model::Rel::Content
  include Cms::Model::Auth::Content
  include GpCategory::Model::Rel::Category

  column_attribute :body, html: true
  column_attribute :remark, html: true
  column_attribute :description, html: true

  enum_ish :state, [:draft, :public, :closed], default: :public, predicate: true

  # Content
  belongs_to :content, class_name: 'Reception::Content::Course', required: true

  has_many :opens, -> { order_by_open_at }, dependent: :destroy
  has_many :public_opens, -> { public_state.order_by_open_at }, class_name: 'Reception::Open'

  after_save :set_name

  after_save     Cms::Publisher::ContentCallbacks.new(belonged: true), if: :saved_changes?
  before_destroy Cms::Publisher::ContentCallbacks.new(belonged: true), prepend: true

  validates :title, presence: true
  validates :name, exclusion: { in: %w(categories) }

  scope :public_state, -> { where(state: 'public') }
  scope :with_target, ->(target) { target.present? ? where(state: target) : all }
  scope :search_with_criteria, ->(criteria) {
    rel = all
    rel = rel.where(state: criteria[:state]) if criteria[:state].present?
    rel = rel.search_with_text(:title, :subtitle, :body, :remark, :description, criteria[:keyword]) if criteria[:keyword].present?
    rel
  }
  scope :has_public_opens, -> {
    distinct.joins(:opens)
            .where(state: 'public')
            .merge(Reception::Open.public_state)
  }
  scope :has_available_opens, -> {
    distinct.joins(:opens)
            .where(state: 'public')
            .merge(Reception::Open.available_period)
  }
  scope :order_by_min_open_at, ->(sort = 'asc') {
    sql = Reception::Open.select(%Q|MIN("reception_opens"."open_on" + "reception_opens"."start_at")|)
                         .where(%Q|"reception_courses"."id" = "reception_opens"."course_id"|).to_sql
    sort = sort.downcase == 'asc' ? 'ASC' : 'DESC'
    order(Arel.sql("(#{sql}) #{sort}"))
  }

  def applicants
    Reception::Applicant.joins(:open).where(Reception::Open.arel_table[:course_id].eq(id))
  end

  def applicant_tokens
    Reception::ApplicantToken.joins(:open).where(Reception::Open.arel_table[:course_id].eq(id))
  end

  def applicable_opens
    opens.joins(:course)
         .merge(Reception::Open.public_state)
         .merge(Reception::Open.available_period)
         .merge(Reception::Open.within_capacity)
  end

  def public_uri
    return unless node = content.node
    "#{node.public_uri}#{name}/"
  end

  def bread_crumbs(node)
    crumbs = []

    if content.doc_list_style == 'all_categories'
      categories.public_state.each do |category|
        category_type = category.category_type
        if (node = content.public_node)
          crumb = node.bread_crumbs.crumbs.first
          category.ancestors.each {|a| crumb << [a.title, "#{node.public_uri}categories/#{category_type.name}/#{a.path_from_root_category}/"] }
          crumbs << crumb
        end
      end
    end

    if content
      if (node = content.public_node)
        crumb = node.bread_crumbs.crumbs.first
        crumb << [title, public_uri]
        crumbs << crumb
      end
    end

    if crumbs.empty?
      node.routes.each do |r|
        crumb = []
        r.each {|i| crumb << [i.title, i.public_uri] }
        crumbs << crumb
      end
    end

    Cms::Lib::BreadCrumbs.new(crumbs)
  end

  def applicable?
    opens.any?(&:applicable?)
  end

  def fee=(val)
    val = val.delete(',') if val.is_a?(String)
    super
  end

  private

  def set_name
    update_column(:name, id) if name.blank?
  end
end
