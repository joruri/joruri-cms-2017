@cms_content_settings_0 = Cms::ContentSetting.new(id: 0)
@cms_content_settings_1 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "lang",
  value: <<EOS.chomp,
日本語 ja,英語 en,中国語（簡体） zh-CN,中国語（繁体） zh-tw,韓国語 ko
EOS
)
@cms_content_settings_2 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "allowed_attachment_type",
  value: ""
)
@cms_content_settings_3 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "attachment_thumbnail_size",
  value: <<EOS.chomp,
120x90
EOS
)
@cms_content_settings_4 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "feature_settings",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
feature_1: 'true'
feature_2: 

EOS
)
@cms_content_settings_5 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "save_button_states",
  value: <<EOS.chomp,
--- []

EOS
)
@cms_content_settings_6 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "inquiry_setting",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
state: visible
display_fields: []
inquiry_title: この記事に関するお問い合わせ
inquiry_style: "@name@@address@@tel@@fax@@email_link@"

EOS
)
@cms_content_settings_7 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "blog_functions",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
comment: disabled
comment_open: immediate
comment_notification_mail: disabled
footer_style: 投稿者：@user@ @publish_time@ カテゴリ：@category_link@

EOS
)
@cms_content_settings_8 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "pagination_label",
  value: <<EOS.chomp,
前へ
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
next_label: 次へ

EOS
)
@cms_content_settings_9 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "doc_list_pagination",
  value: <<EOS.chomp,
monthly
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
doc_list_style: simple
doc_list_number: '30'
doc_weekly_style: "%Y年%m月%d日"
doc_monthly_style: "%Y年%m月"
doc_publish_more_pages: '10'

EOS
)
@cms_content_settings_10 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "docs_order",
  value: <<EOS.chomp,
updated_at_desc
EOS
)
@cms_content_settings_11 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "list_style",
  value: <<EOS.chomp,
@title_link@（@update_date@ @group@）
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
wrapper_tag: li

EOS
)
@cms_content_settings_12 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日
EOS
)
@cms_content_settings_13 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "time_style",
  value: <<EOS.chomp,
%H時%M分
EOS
)
@cms_content_settings_14 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "feed",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
feed_docs_number: '10'
feed_docs_period: 

EOS
)
@cms_content_settings_15 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "serial_no_settings",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_16 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "display_dates",
  value: <<EOS.chomp,
---
- published_at
- updated_at

EOS
)
@cms_content_settings_17 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "rel_docs_style",
  value: <<EOS.chomp,
@title_link@
EOS
)
@cms_content_settings_18 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "qrcode_settings",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
state: hidden

EOS
)
@cms_content_settings_19 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "broken_link_notification",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_20 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "map_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
map_content_id: #{@cms_contents_0.id}
lat_lng: ''
marker_icon_category: disabled

EOS
)
@cms_content_settings_21 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "tag_relation",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
tag_content_tag_id: #{@cms_contents_3.id}

EOS
)
@cms_content_settings_22 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "approval_relation",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
approval_content_id: #{@cms_contents_4.id}

EOS
)
@cms_content_settings_23 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "calendar_relation",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
calendar_content_id: #{@cms_contents_7.id}
event_sync_settings: disabled
event_sync_default_will_sync: disabled

EOS
)
@cms_content_settings_24 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "list_style",
  value: <<EOS.chomp,
@title_link@（@update_date@ @group@）
EOS
)
@cms_content_settings_25 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日
EOS
)
@cms_content_settings_26 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "time_style",
  value: <<EOS.chomp,
%H時%M分
EOS
)
@cms_content_settings_27 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "docs_order",
  value: <<EOS.chomp,
updated_at_desc
EOS
)
@cms_content_settings_28 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "feed",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
feed_docs_number: 10
feed_docs_period: 

EOS
)
@cms_content_settings_29 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_3.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日
EOS
)
@cms_content_settings_30 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_3.id,
  name: "list_style",
  value: <<EOS.chomp,
@title_link@（@update_date@ @group@）
EOS
)
@cms_content_settings_31 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "article_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: ""
)
@cms_content_settings_32 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "list_style",
  value: <<EOS.chomp,
@name_link@
EOS
)
@cms_content_settings_33 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "doc_style",
  value: <<EOS.chomp,
@title_link@（@update_date@ @group@）
EOS
)
@cms_content_settings_34 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日
EOS
)
@cms_content_settings_35 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "time_style",
  value: <<EOS.chomp,
%H時%M分
EOS
)
@cms_content_settings_36 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "num_docs",
  value: <<EOS.chomp,
10
EOS
)
@cms_content_settings_37 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "docs_order",
  value: <<EOS.chomp,
updated_at_desc
EOS
)
@cms_content_settings_38 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_5.id,
  name: "feed",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess {}

EOS
)
@cms_content_settings_39 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_6.id,
  name: "approval_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: ""
)
@cms_content_settings_40 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日（%a）
EOS
)
@cms_content_settings_41 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "list_style",
  value: <<EOS.chomp,
---
- !ruby/object:ActionController::Parameters
  parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
    header: 開催日
    data: "@hold_date@"
  permitted: false
- !ruby/object:ActionController::Parameters
  parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
    header: 分類
    data: "@category@"
  permitted: false
- !ruby/object:ActionController::Parameters
  parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
    header: タイトル
    data: "@title_link@"
  permitted: false

EOS
)
@cms_content_settings_42 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "today_list_style",
  value: <<EOS.chomp,
---
- :header: 開催日
  :data: "@hold_date@"
- :header: タイトル
  :data: "@title_link@"

EOS
)
@cms_content_settings_43 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "calendar_list_style",
  value: <<EOS.chomp,
@title_link@
EOS
)
@cms_content_settings_44 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "search_list_style",
  value: <<EOS.chomp,
---
- :header: 開催日
  :data: "@hold_date@"
- :header: タイトル
  :data: "@title_link@"

EOS
)
@cms_content_settings_45 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "event_sync_import",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_46 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "event_sync_export",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_47 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_8.id,
  name: "click_count_setting",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_48 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "word_dictionary",
  value: ""
)
@cms_content_settings_49 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "gp_category_content_category_type_id",
  value: <<EOS.chomp,
#{@cms_contents_2.id}
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
category_type_ids:
- #{@gp_category_category_types_2.id}
- #{@gp_category_category_types_1.id}
- #{@gp_category_category_types_3.id}
- #{@gp_category_category_types_4.id}
visible_category_type_ids:
- #{@gp_category_category_types_2.id}
- #{@gp_category_category_types_1.id}
- #{@gp_category_category_types_3.id}
- #{@gp_category_category_types_4.id}
default_category_type_id: #{@gp_category_category_types_0.id}
default_category_id: #{@gp_category_categories_0.id}

EOS
)
@cms_content_settings_50 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "organization_content_group_id",
  value: <<EOS.chomp,
#{@cms_contents_5.id}
EOS
)
@cms_content_settings_51 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "category_type_style",
  value: <<EOS.chomp,
all_categories
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
category_type_doc_style: "@title@（@update_date@ @group@）"
category_type_docs_number: ''

EOS
)
@cms_content_settings_52 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "doc_style",
  value: "",
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
doc_doc_style: ''
doc_docs_number: ''

EOS
)
@cms_content_settings_53 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_2.id,
  name: "category_style",
  value: <<EOS.chomp,
categories_with_docs
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
category_doc_style: "@title_link@（@update_date@ @group@）"
category_docs_number: ''

EOS
)
@cms_content_settings_54 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_9.id,
  name: "gp_category_content_category_type_id",
  value: <<EOS.chomp,
#{@cms_contents_2.id}
EOS
  extra_value: ""
)
@cms_content_settings_55 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "lang",
  value: <<EOS.chomp,
日本語 ja,英語 en,中国語（簡体） zh-CN,中国語（繁体） zh-tw,韓国語 ko
EOS
)
@cms_content_settings_56 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "attachment_thumbnail_size",
  value: <<EOS.chomp,
120x90
EOS
)
@cms_content_settings_57 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "feature_settings",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
feature_1: 'true'
feature_2: 

EOS
)
@cms_content_settings_58 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "save_button_states",
  value: <<EOS.chomp,
--- []

EOS
)
@cms_content_settings_59 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "inquiry_setting",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
state: 
display_fields:
- group_id
- address
- tel
- fax
- email
- note
inquiry_title: お問い合わせ
inquiry_style: "@name@@address@@tel@@fax@@email_link@"

EOS
)
@cms_content_settings_60 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "blog_functions",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
comment: disabled
comment_open: immediate
comment_notification_mail: disabled
footer_style: 投稿者：@user@ @publish_time@ カテゴリ：@category_link@

EOS
)
@cms_content_settings_61 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "pagination_label",
  value: <<EOS.chomp,
前へ
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
next_label: 次へ

EOS
)
@cms_content_settings_62 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "doc_list_pagination",
  value: <<EOS.chomp,
simple
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
doc_list_style: simple
doc_list_number: '30'
doc_weekly_style: "%Y年%m月%d日"
doc_monthly_style: "%Y年%m月"
doc_publish_more_pages: '10'

EOS
)
@cms_content_settings_63 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "docs_order",
  value: <<EOS.chomp,
updated_at_desc
EOS
)
@cms_content_settings_64 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "list_style",
  value: <<EOS.chomp,
@title_link@
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
wrapper_tag: li

EOS
)
@cms_content_settings_65 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日
EOS
)
@cms_content_settings_66 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "time_style",
  value: <<EOS.chomp,
%H時%M分
EOS
)
@cms_content_settings_67 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "feed",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
feed_docs_number: '10'
feed_docs_period: 

EOS
)
@cms_content_settings_68 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "serial_no_settings",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_69 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "display_dates",
  value: <<EOS.chomp,
---
- published_at
- updated_at

EOS
)
@cms_content_settings_70 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "rel_docs_style",
  value: <<EOS.chomp,
@title_link@
EOS
)
@cms_content_settings_71 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "qrcode_settings",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
state: hidden

EOS
)
@cms_content_settings_72 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "broken_link_notification",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_73 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "map_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
map_content_id: #{@cms_contents_0.id}
lat_lng: ''
marker_icon_category: disabled

EOS
)
@cms_content_settings_74 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "tag_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
tag_content_tag_id: #{@cms_contents_0.id}

EOS
)
@cms_content_settings_75 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "approval_relation",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: ""
)
@cms_content_settings_76 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "calendar_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
calendar_content_id: #{@cms_contents_0.id}

EOS
)
@cms_content_settings_77 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "gp_category_content_category_type_id",
  value: <<EOS.chomp,
#{@cms_contents_2.id}
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
category_type_ids:
- #{@gp_category_category_types_1.id}
- #{@gp_category_category_types_3.id}
visible_category_type_ids:
- #{@gp_category_category_types_1.id}
- #{@gp_category_category_types_3.id}
default_category_type_id: #{@gp_category_category_types_0.id}
default_category_id: #{@gp_category_categories_0.id}

EOS
)
@cms_content_settings_78 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "organization_content_group_id",
  value: ""
)
@cms_content_settings_79 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "basic_setting",
  value: <<EOS.chomp,
#{@cms_concepts_1.id}
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
default_layout_id: #{@cms_layouts_4.id}

EOS
)
@cms_content_settings_80 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "basic_setting",
  value: <<EOS.chomp,
#{@cms_concepts_1.id}
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
default_layout_id: #{@cms_layouts_10.id}

EOS
)
@cms_content_settings_81 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_6.id,
  name: "captcha",
  value: <<EOS.chomp,
enabled
EOS
)
@cms_content_settings_82 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_6.id,
  name: "auto_reply",
  value: <<EOS.chomp,
send
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
upper_reply_text: "以下の内容を受け付けました。\\r\\nお返事までにお時間がかかる場合がございますのでご了承ください。\\r\\n\\r\\n"
lower_reply_text: ''

EOS
)
@cms_content_settings_83 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_6.id,
  name: "mail_from",
  value: <<EOS.chomp,
noreply
EOS
)
@cms_content_settings_84 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_6.id,
  name: "mail_to",
  value: <<EOS.chomp,
noreply
EOS
)
@cms_content_settings_85 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "lang",
  value: <<EOS.chomp,
日本語 ja,英語 en,中国語（簡体） zh-CN,中国語（繁体） zh-tw,韓国語 ko
EOS
)
@cms_content_settings_86 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "attachment_thumbnail_size",
  value: <<EOS.chomp,
120x90
EOS
)
@cms_content_settings_87 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "feature_settings",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
feature_1: 'true'
feature_2: 

EOS
)
@cms_content_settings_88 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "save_button_states",
  value: <<EOS.chomp,
--- []

EOS
)
@cms_content_settings_89 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "inquiry_setting",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
state: visible
display_fields: []
inquiry_title: この記事に関するお問い合わせ
inquiry_style: "@name@@address@@tel@@fax@@email_link@"

EOS
)
@cms_content_settings_90 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "blog_functions",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
footer_style: 投稿者：@user@ @publish_time@ カテゴリ：@category_link@

EOS
)
@cms_content_settings_91 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "pagination_label",
  value: <<EOS.chomp,
前へ
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
next_label: 次へ

EOS
)
@cms_content_settings_92 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "doc_list_pagination",
  value: <<EOS.chomp,
simple
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
doc_list_style: simple
doc_list_number: '30'
doc_weekly_style: "%Y年%m月%d日"
doc_monthly_style: "%Y年%m月"
doc_publish_more_pages: '10'

EOS
)
@cms_content_settings_93 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "docs_order",
  value: <<EOS.chomp,
updated_at_desc
EOS
)
@cms_content_settings_94 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "list_style",
  value: <<EOS.chomp,
@title_link@
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
wrapper_tag: li

EOS
)
@cms_content_settings_95 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日
EOS
)
@cms_content_settings_96 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "time_style",
  value: <<EOS.chomp,
%H時%M分
EOS
)
@cms_content_settings_97 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "feed",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
feed_docs_number: '10'
feed_docs_period: 

EOS
)
@cms_content_settings_98 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "serial_no_settings",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_99 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "display_dates",
  value: <<EOS.chomp,
---
- published_at
- updated_at

EOS
)
@cms_content_settings_100 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "rel_docs_style",
  value: <<EOS.chomp,
@title_link@
EOS
)
@cms_content_settings_101 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "qrcode_settings",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
state: hidden

EOS
)
@cms_content_settings_102 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "broken_link_notification",
  value: <<EOS.chomp,
disabled
EOS
)
@cms_content_settings_103 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "map_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
map_content_id: #{@cms_contents_0.id}
lat_lng: ''
marker_icon_category: disabled

EOS
)
@cms_content_settings_104 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "tag_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
tag_content_tag_id: #{@cms_contents_0.id}

EOS
)
@cms_content_settings_105 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "approval_relation",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
approval_content_id: #{@cms_contents_4.id}

EOS
)
@cms_content_settings_106 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "calendar_relation",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
calendar_content_id: #{@cms_contents_0.id}

EOS
)
@cms_content_settings_107 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "gp_category_content_category_type_id",
  value: <<EOS.chomp,
#{@cms_contents_2.id}
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
category_type_ids:
- #{@gp_category_category_types_2.id}
- #{@gp_category_category_types_1.id}
- #{@gp_category_category_types_3.id}
visible_category_type_ids:
- #{@gp_category_category_types_2.id}
- #{@gp_category_category_types_1.id}
- #{@gp_category_category_types_3.id}
default_category_type_id: #{@gp_category_category_types_0.id}
default_category_id: #{@gp_category_categories_0.id}

EOS
)
@cms_content_settings_108 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_7.id,
  name: "gp_category_content_category_type_id",
  value: <<EOS.chomp,
#{@cms_contents_2.id}
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
category_type_ids:
- #{@gp_category_category_types_4.id}

EOS
)
@cms_content_settings_109 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "basic_setting",
  value: <<EOS.chomp,
#{@cms_concepts_1.id}
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
default_layout_id: #{@cms_layouts_14.id}

EOS
)
@cms_content_settings_110 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "word_dictionary",
  value: ""
)
@cms_content_settings_111 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_1.id,
  name: "map_setting",
  value: <<EOS.chomp,
enabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
lat_lng: ''

EOS
)
@cms_content_settings_112 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_10.id,
  name: "map_setting",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
lat_lng: ''

EOS
)
@cms_content_settings_113 ||= Cms::ContentSetting.create!(
  content_id: @cms_contents_11.id,
  name: "map_setting",
  value: <<EOS.chomp,
disabled
EOS
  extra_value: <<EOS.chomp,
--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess
lat_lng: ''

EOS
)
