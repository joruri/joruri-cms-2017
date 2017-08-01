class GpCategory::Content::Setting < Cms::ContentSetting
  set_config :list_style,
    name: "#{GpArticle::Doc.model_name.human}表示形式",
    form_type: :text_area,
    upper_text: '<a href="#" class="show_dialog">置き換えテキストを確認する</a>',
    default_value: '@title_link@(@publish_date@ @group@)'
  set_config :date_style,
    name: "#{GpArticle::Doc.model_name.human}日付形式",
    comment: I18n.t('comments.date_style'),
    default_value: '%Y年%m月%d日 %H時%M分'
  set_config :time_style,
    name: "#{GpArticle::Doc.model_name.human}時間形式",
    comment: I18n.t('comments.time_style'),
    default_value: '%H時%M分'
  set_config :category_type_style,
    name: "#{GpCategory::CategoryType.model_name.human}表示形式",
    options: [['全カテゴリ一覧', 'all_categories'], ['全記事一覧', 'all_docs'], ['カテゴリ＋記事', 'categories_with_docs']],
    default_extra_values: {
      category_type_doc_style: '@title_link@',
      category_type_docs_number: nil
    }
  set_config :category_style,
    name: "#{GpCategory::Category.model_name.human}表示形式",
    options: [['カテゴリ一覧＋記事一覧', 'categories_and_docs'], ['カテゴリ＋記事', 'categories_with_docs']],
    default_extra_values: {
      category_doc_style: '@title_link@',
      category_docs_number: nil
    }
  set_config :doc_style,
    name: '新着記事一覧表示形式',
    options: [['全記事一覧', 'all_docs']],
    default_extra_values: {
      doc_doc_style: '@title_link@',
      doc_docs_number: nil
    }
  set_config :docs_order,
    name: '記事一覧表示順',
    options: GpCategory::Content::CategoryType::DOCS_ORDER_OPTIONS,
    default_value: 'published_at_desc'
  set_config :index_template_id,
    name: 'index設定',
    options: lambda {->(content=nil) do
        if content
          GpCategory::Content::CategoryType.find_by(id: content.id).templates.map{|t| [t.title, t.id] }
        else
          []
        end
      end}
  set_config :feed,
    name: "フィード",
    form_type: :radio_buttons,
    options: [['表示する', 'enabled'], ['表示しない', 'disabled']],
    default_value: 'enabled',
    default_extra_values: {
      feed_docs_number: '10',
      feed_docs_period: nil
    }

  belongs_to :content, foreign_key: :content_id, class_name: 'GpCategory::Content::CategoryType'

  def extra_values=(params)
    ex = extra_values
    case name
    when 'category_type_style'
      ex[:category_type_doc_style] = params[:category_type_doc_style]
      ex[:category_type_docs_number] = params[:category_type_docs_number]
    when 'category_style'
      ex[:category_doc_style] = params[:category_doc_style]
      ex[:category_docs_number] = params[:category_docs_number]
    when 'doc_style'
      ex[:doc_doc_style] = params[:doc_doc_style]
      ex[:doc_docs_number] = params[:doc_docs_number]
    when 'feed'
      ex[:feed_docs_number] = params[:feed_docs_number]
      ex[:feed_docs_period] = params[:feed_docs_period]
    end
    super(ex)
  end
end
