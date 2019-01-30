class GpCategory::Category < ApplicationRecord
  include Sys::Model::Base
  include Sys::Model::Rel::Creator
  include Sys::Model::Tree
  include Cms::Model::Auth::Content
  include Cms::Model::Base::Page
  include Cms::Model::Base::Sitemap

  default_scope { order(category_type_id: :asc, parent_id: :asc, level_no: :asc, sort_no: :asc, name: :asc) }

  enum_ish :state, [:public, :closed], default: :public, predicate: true
  enum_ish :docs_order, ['',
                         'display_published_at DESC, published_at DESC',
                         'display_published_at ASC, published_at ASC',
                         'display_updated_at DESC, updated_at DESC',
                         'display_updated_at ASC, updated_at ASC'], default: ''

  # Page
  belongs_to :concept, class_name: 'Cms::Concept'
  belongs_to :layout, class_name: 'Cms::Layout'
  belongs_to :template

  belongs_to :category_type, class_name: 'GpCategory::CategoryType', required: true

  belongs_to :parent, foreign_key: :parent_id, class_name: self.name, counter_cache: :children_count
  has_many :children, foreign_key: :parent_id, class_name: self.name, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: [:category_type_id, :parent_id] },
                   format: { with: /\A[0-9A-Za-z@\.\-_\+]+\z/ }
  validates :title, presence: true
  validates :state, presence: true

  has_many :categorizations, dependent: :destroy
  has_many :doc_categorizations, -> { where(categorized_as: 'GpArticle::Doc') }, class_name: 'GpCategory::Categorization'

  has_many :categorized_docs, through: :doc_categorizations, source: :categorizable, source_type: 'GpArticle::Doc'
  has_many :categorized_markers, through: :categorizations, source: :categorizable, source_type: 'Map::Marker'
  has_many :categorized_events, -> { order(:started_on, :ended_on) },
                                through: :categorizations, source: :categorizable, source_type: 'GpCalendar::Event'

  has_many :map_marker_icons, class_name: 'Map::MarkerIcon', as: :relatable, dependent: :destroy
  has_many :gnav_category_sets, class_name: 'Gnav::CategorySet', dependent: :destroy

  # conditional associations
  has_many :public_children, -> { public_state },
                             foreign_key: :parent_id, class_name: self.name

  delegate :content, to: :category_type
  delegate :site, to: :content
  delegate :site_id, to: :content

  before_validation :set_attributes_from_parent

  after_save     GpCategory::Publisher::CategoryCallbacks.new, if: :saved_changes?
  before_destroy GpCategory::Publisher::CategoryCallbacks.new, prepend: true

  scope :with_root, -> { where(parent_id: nil) }
  scope :public_state, -> { where(state: 'public') }

  after_update :move_published_files
  after_destroy :clean_published_files

  nested_scope :in_site, through: :category_type

  def tree_title(prefix: '　　', depth: 0)
    prefix * [level_no - 1 + depth, 0].max + title
  end

  def descendants(categories=[])
    categories << self
    children.each {|c| c.descendants(categories) }
    return categories
  end

  def descendants_ids
    descendants_with_preload.map(&:id)
  end

  def descendants_with_preload
    GpCategory::CategoriesPreloader.new(self).preload(:descendants)
    descendants
  end

  def public_descendants(categories=[])
    return categories unless self.state_public?
    categories << self
    public_children.each {|c| c.public_descendants(categories) }
    return categories
  end

  def public_descendants_with_preload
    GpCategory::CategoriesPreloader.new(self).preload(:public_descendants)
    public_descendants
  end

  def descendants_for_option(categories=[])
    categories << [tree_title, id]
    children.includes(:children).each {|c| c.descendants_for_option(categories) } unless children.empty?
    return categories
  end

  def ancestors(categories=[])
    parent.ancestors(categories) if parent
    categories << self
  end

  def public_ancestors
    ancestors.select { |c| c.state == 'public' }
  end

  def path_from_root_category
    ancestors.map{|a| a.name }.join('/')
  end

  def bread_crumbs(category_type_node)
    crumbs = []

    if content
      if (node = content.public_node)
        c = node.bread_crumbs.crumbs.first
        c << [category_type.title, "#{node.public_uri}#{category_type.name}/"]
        ancestors.each {|a| c << [a.title, "#{node.public_uri}#{category_type.name}/#{a.path_from_root_category}/"] }
        crumbs << c
      end
    end

    if crumbs.empty?
      category_type_node.routes.each do |r|
        c = []
        r.each {|i| c << [i.title, i.public_uri] }
        crumbs << c
      end
    end

    Cms::Lib::BreadCrumbs.new(crumbs)
  end

  def public_uri
    return if (uri = category_type.public_uri).blank?
    "#{uri}#{path_from_root_category}/"
  end

  def admin_uri(options = {})
    controller = self.class.name.tableize.sub('/', '/admin/')
    Rails.application.routes.url_helpers.url_for({ controller: controller,
                                                   action: :show,
                                                   content: content,
                                                   concept: content.concept_id,
                                                   category_type_id: category_type_id,
                                                   category_id: parent_id,
                                                   id: id,
                                                   only_path: true }.merge(options))
  rescue ActionController::UrlGenerationError => e
    warn_log e
    nil
  end

  def docs
    categorized_docs.order(inherited_docs_order)
  end

  def inherited_docs_order
    if docs_order.present?
      docs_order_as_hash(docs_order)
    elsif parent
      parent.inherited_docs_order
    elsif category_type.docs_order.present?
      docs_order_as_hash(category_type.docs_order)
    else
      docs_order_as_hash(content.translated_docs_order)
    end
  end

  def unique_sort_key
    ancestors.inject('') {|k, a| k.concat('__%032d_%32s_%032d_%032d_%032d_%032d_%32s' % [a.category_type.sort_no.to_i, a.category_type.name.to_s,
                                                                                         a.category_type_id.to_i, a.parent_id.to_i, a.level_no.to_i, a.sort_no.to_i, a.name.to_s]) }
  end

  def inherited_template
    return self.template if self.template
    return parent.inherited_template if parent
    category_type.template
  end

  private

  def set_attributes_from_parent
    if parent
      self.category_type = parent.category_type
      self.level_no = parent.level_no + 1
    else
      self.level_no = 1
    end
  end

  def clean_published_files
    FileUtils.rm_r(public_path) if public_path.present? && ::File.exist?(public_path)
    FileUtils.rm_r(public_smart_phone_path) if public_smart_phone_path.present? && ::File.exist?(public_smart_phone_path)
  end

  def move_published_files
    return if saved_changes[:name].blank?
    old_name, new_name = saved_changes[:name]
    return if old_name.blank? || new_name.blank?
    rename_directory(new_path: public_path, old_name: old_name)
    rename_directory(new_path: public_smart_phone_path, old_name: old_name)
  end

  def rename_directory(new_path:, old_name:)
    return unless Regexp.new("\\A#{Rails.root}/[^/]+") =~ new_path.to_s

    new_path = Pathname.new(new_path.to_s) unless new_path.kind_of?(Pathname)
    return if new_path.exist?

    old_path = new_path.dirname.join(old_name)
    return unless old_path.directory?

    old_path.rename(new_path)
  end

  def docs_order_as_hash(order_text)
    return {} if order_text.blank?
    order_text.split(',').each_with_object({}) do |order, hash|
      key, value = order.strip.split(' ')
      hash.merge!(key => value)
    end
  end

  class << self
    def docs_for_template_module(category, template_module)
      categories = case template_module.module_type
                   when 'docs_1', 'docs_3', 'docs_5', 'docs_7', 'docs_8'
                     category.public_descendants
                   when 'docs_2', 'docs_4', 'docs_6'
                     [category]
                   end
      docs = GpArticle::Doc.categorized_into(categories).except(:order)
      docs = docs.where(content_id: template_module.gp_article_content_ids) if template_module.gp_article_content_ids.present?
      docs
    end
  end
end
