class Organization::Content::Setting < Cms::ContentSetting
  set_config :article_relation,
    name: '記事URL保持許可',
    form_type: :radio_buttons,
    options: [['使用する', 'enabled'], ['使用しない', 'disabled']],
    default_value: 'disabled',
    default_extra_values: {
      gp_article_content_doc_id: nil
    }
  set_config :list_style,
    name: "#{Organization::Group.model_name.human}一覧表示形式",
    form_type: :text_area,
    upper_text: '<a href="#" class="show_group_list_style_dialog">置き換えテキストを確認する</a>',
    default_value: '@name_link@'
  set_config :doc_style,
    name: "#{GpArticle::Doc.model_name.human}表示形式",
    form_type: :text_area,
    upper_text: '<a href="#" class="show_dialog">置き換えテキストを確認する</a>',
    default_value: '@title_link@(@publish_date@ @group@)'
  set_config :date_style,
    name: "#{GpArticle::Doc.model_name.human}日付形式",
    comment: I18n.t('comments.date_style'),
    default_value: '%Y年%m月%d日'
  set_config :time_style,
    name: "#{GpArticle::Doc.model_name.human}時間形式",
    comment: I18n.t('comments.time_style'),
    default_value: '%H時%M分'
  set_config :num_docs,
    name: "#{GpArticle::Doc.model_name.human}表示件数",
    default_value: '10'
  set_config :docs_order,
    name: '記事表示順',
    options: Organization::Content::Group::DOCS_ORDER_OPTIONS,
    default_value: 'published_at_desc'
  set_config :gp_category_content_category_type_id,
    name: 'カテゴリ種別',
    options: lambda { GpCategory::Content::CategoryType.where(site_id: Core.site.id).map { |ct| [ct.name, ct.id] } }
  set_config :feed,
    name: "フィード",
    form_type: :radio_buttons,
    options: [['表示する', 'enabled'], ['表示しない', 'disabled']],
    default_value: 'disabled',
    default_extra_values: {
      feed_docs_number: '10',
      feed_docs_period: nil
    }

  belongs_to :content, foreign_key: :content_id, class_name: 'Organization::Content::Group'

  validate :validate_value

  def extra_values=(params)
    ex = extra_values
    case name
    when 'article_relation'
      ex[:gp_article_content_doc_id] = params[:gp_article_content_doc_id].to_i
    end
    super(ex)
  end

  private

  def validate_value
    case name
    when 'num_docs'
      errors.add :value, :not_a_number unless value =~ /^\d+$/
    end
  end
end
