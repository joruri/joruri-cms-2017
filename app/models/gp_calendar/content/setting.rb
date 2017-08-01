class GpCalendar::Content::Setting < Cms::ContentSetting
  set_config :gp_category_content_category_type_id,
    name: 'カテゴリ種別',
    options: lambda { GpCategory::Content::CategoryType.where(site_id: Core.site.id).map { |ct| [ct.name, ct.id] } },
    default_extra_values: {
      category_type_ids: []
    }
  set_config :date_style,
    name: '日付形式',
    comment: '<strong>年：</strong>%Y <strong>月：</strong>%m <strong>日：</strong>%d <strong>曜日：</strong>%A <strong>曜日（省略）：</strong>%a',
    default_value: '%Y年%m月%d日（%a）'
  set_config :list_style,
    name: '表示形式/イベント一覧',
    upper_text: '<a href="#" class="show_dialog">置き換えテキストを確認する</a>',
    form_type: :table_field,
    default_value: [{header: '開催日', data: '@hold_date@'}, {header: 'タイトル', data: '@title_link@'}]
  set_config :today_list_style,
    name: '表示形式/今日のイベント',
    upper_text: '<a href="#" class="show_dialog">置き換えテキストを確認する</a>',
    form_type: :table_field,
    default_value: [{header: '開催日', data: '@hold_date@'}, {header: 'タイトル', data: '@title_link@'}]
  set_config :calendar_list_style,
    name: '表示形式/イベントカレンダー',
    upper_text: '<a href="#" class="show_dialog">置き換えテキストを確認する</a>',
    default_value: '@title_link@'
  set_config :search_list_style,
    name: '表示形式/イベント検索',
    upper_text: '<a href="#" class="show_dialog">置き換えテキストを確認する</a>',
    form_type: :table_field,
    default_value: [{header: '開催日', data: '@hold_date@'}, {header: 'タイトル', data: '@title_link@'}]
  set_config :default_image,
    name: '初期画像',
    comment: '（例 /images/sample.jpg ）'

  belongs_to :content, foreign_key: :content_id, class_name: 'GpCalendar::Content::Event'

  def extra_values=(params)
    ex = extra_values
    case name
    when 'gp_category_content_category_type_id'
      ex[:category_type_ids] = params[:category_type_ids].to_a.map(&:to_i).uniq
    end
    super(ex)
  end

  def category_type_ids
    extra_values[:category_type_ids] || []
  end
end
