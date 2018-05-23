class GpCategory::Public::TemplateModule::CategoryTypesController < GpCategory::Public::TemplateModuleController
  def pre_dispatch
    @content = params.delete(:content)
    @template_module = params.delete(:template_module)
    @category_types = @content.public_category_types

    @category_type = params.delete(:category_type)
    @categories = @category_type.public_root_categories if @category_type
  end

  def index_categories_1
  end

  def index_categories_2
  end

  def index_categories_3
  end

  def index_categories_summary_1
  end

  def index_categories_summary_2
  end

  def index_categories_summary_3
  end

  def index_docs_1
    categories = @category_types.flat_map(&:public_categories)

    docs = GpArticle::Doc.categorized_into(categories).except(:order)
    docs = docs.where(content_id: @template_module.gp_article_content_ids) if @template_module.gp_article_content_ids.present?
    @docs = docs.order(@content.translated_docs_order)
                .paginate(page: 1, per_page: @template_module.num_docs)
    return render plain: '' if @docs.empty?
  end

  def index_docs_2
    render plain: ''
  end

  def index_docs_3
    render plain: ''
  end

  def index_docs_4
    render plain: ''
  end

  def index_docs_5
    render plain: ''
  end

  def index_docs_6
    render plain: ''
  end

  def index_docs_7
    render plain: ''
  end

  def index_docs_8
    render plain: ''
  end

  def show_categories_1
  end

  def show_categories_2
  end

  def show_categories_3
  end

  def show_categories_summary_1
  end

  def show_categories_summary_2
  end

  def show_categories_summary_3
  end

  def show_docs_1
    @docs = GpCategory::CategoryType.docs_for_template_module(@category_type, @template_module)
                                    .order(@content.translated_docs_order)
                                    .paginate(page: 1, per_page: @template_module.num_docs)
    return render plain: '' if @docs.empty?
  end

  def show_docs_2
    render plain: ''
  end

  def show_docs_3
    return render plain: '' unless @category_type.internal_category_type

    docs = GpCategory::CategoryType.docs_for_template_module(@category_type, @template_module)
    return render plain: '' if docs.empty?

    @categories = @category_type.internal_category_type.public_root_categories
    @category_docs = @categories.each_with_object({}) do |category, hash|
      hash[category.id] = docs.categorized_into(category.public_descendants)
                              .order(@content.translated_docs_order)
                              .paginate(page: 1, per_page: @template_module.num_docs)
    end
    return render plain: '' if @category_docs.all?(&:empty?)
  end

  def show_docs_4
    render plain: ''
  end

  def show_docs_5
    docs = GpCategory::CategoryType.docs_for_template_module(@category_type, @template_module)
                                   .joins(creator: :group)
    return render plain: '' if docs.empty?

    group_ids = docs.pluck(Sys::Group.arel_table[:id])
    @groups = Sys::Group.where(id: group_ids).order(code: :asc)
    @group_docs = @groups.each_with_object({}) do |group, hash|
      hash[group.id] = docs.organized_into(group.id)
                           .order(@content.translated_docs_order)
                           .paginate(page: 1, per_page: @template_module.num_docs)
    end
    return render plain: '' if @group_docs.all?(&:empty?)
  end

  def show_docs_6
    render plain: ''
  end

  def show_docs_7
    docs = GpCategory::CategoryType.docs_for_template_module(@category_type, @template_module)
    return render plain: '' if docs.empty?

    @categories = @category_type.public_root_categories
    @category_docs = @categories.each_with_object({}) do |category, hash|
      hash[category.id] = docs.categorized_into(category.public_descendants)
                              .order(@content.translated_docs_order)
                              .paginate(page: 1, per_page: @template_module.num_docs)
    end
    return render plain: '' if @category_docs.all?(&:empty?)

    render :show_docs_7
  end

  def show_docs_8
    show_docs_7
  end

  def more
    @docs = GpCategory::CategoryType.docs_for_template_module(@category_type, @template_module)

    if (filter = @more_options[1])
      prefix, code_or_name = filter.split('_', 2)
      case prefix
      when 'c'
        return render plain: '', status: 404 unless @category_type.internal_category_type
        internal_category = @category_type.internal_category_type.public_root_categories.find_by(name: code_or_name)
        return render plain: '', status: 404 unless internal_category
        @docs = @docs.categorized_into(internal_category.public_descendants)
      when 'g'
        group = Sys::Group.in_site(Page.site).where(code: code_or_name).first
        return render plain: '', status: 404 unless group
        @docs = @docs.organized_into(group.id)
      end
    end

    @docs = @docs.order(@content.translated_docs_order)
                 .paginate(page: params[:page], per_page: 30)
    return render plain: '', status: 404 if @docs.current_page > @docs.total_pages
  end
end
