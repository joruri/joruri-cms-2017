@cms_piece_settings_0 = Cms::PieceSetting.new(id: 0)
@cms_piece_settings_1 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_2.id,
  name: "top_label",
  value: <<EOS.chomp,
ホーム
EOS
)
@cms_piece_settings_2 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_5.id,
  name: "group_id",
  value: <<EOS.chomp,
#{@ad_banner_groups_1.id}
EOS
)
@cms_piece_settings_3 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_5.id,
  name: "impl",
  value: <<EOS.chomp,
static
EOS
)
@cms_piece_settings_4 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_5.id,
  name: "lower_text",
  value: <<EOS.chomp,
<div id="slide-controll">\r
<button id="startBtn"><span>再生</span></button><button id="stopBtn"><span>停止</span></button>\r
</div>
EOS
)
@cms_piece_settings_5 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_5.id,
  name: "sort",
  value: <<EOS.chomp,
ordered
EOS
)
@cms_piece_settings_6 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_5.id,
  name: "upper_text",
  value: ""
)
@cms_piece_settings_7 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_6.id,
  name: "date_style",
  value: <<EOS.chomp,
%Y年%m月%d日
EOS
)
@cms_piece_settings_8 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_6.id,
  name: "list_count",
  value: <<EOS.chomp,
10
EOS
)
@cms_piece_settings_9 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_6.id,
  name: "docs_order",
  value: <<EOS.chomp,
updated_at_desc
EOS
)
@cms_piece_settings_10 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_6.id,
  name: "list_style",
  value: <<EOS.chomp,
@title_link@（@update_date@ @group@）
EOS
)
@cms_piece_settings_11 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_6.id,
  name: "more_label",
  value: <<EOS.chomp,
一覧へ
EOS
)
@cms_piece_settings_13 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_9.id,
  name: "category_type_ids",
  value: <<EOS.chomp,
---
- #{@gp_category_category_types_1.id}
- #{@gp_category_category_types_3.id}

EOS
)
@cms_piece_settings_14 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_15.id,
  name: "group_id",
  value: <<EOS.chomp,
#{@ad_banner_groups_2.id}
EOS
)
@cms_piece_settings_15 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_15.id,
  name: "impl",
  value: <<EOS.chomp,
static
EOS
)
@cms_piece_settings_16 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_15.id,
  name: "lower_text",
  value: ""
)
@cms_piece_settings_17 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_15.id,
  name: "sort",
  value: <<EOS.chomp,
ordered
EOS
)
@cms_piece_settings_18 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_15.id,
  name: "upper_text",
  value: <<EOS.chomp,
<a href="/fixed_docs/ad/">広告掲載について</a>
EOS
)
@cms_piece_settings_20 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_18.id,
  name: "category_id",
  value: ""
)
@cms_piece_settings_21 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_18.id,
  name: "category_type_id",
  value: <<EOS.chomp,
#{@gp_category_category_types_3.id}
EOS
)
@cms_piece_settings_22 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_18.id,
  name: "layer",
  value: <<EOS.chomp,
descendants
EOS
)
@cms_piece_settings_23 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_18.id,
  name: "setting_state",
  value: <<EOS.chomp,
enabled
EOS
)
@cms_piece_settings_24 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_24.id,
  name: "num_docs_visibility",
  value: <<EOS.chomp,
hidden
EOS
)
@cms_piece_settings_25 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_24.id,
  name: "order",
  value: <<EOS.chomp,
asc
EOS
)
@cms_piece_settings_26 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_24.id,
  name: "term",
  value: <<EOS.chomp,
year_month
EOS
)
@cms_piece_settings_27 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_26.id,
  name: "source",
  value: <<EOS.chomp,
organization_group
EOS
)
@cms_piece_settings_28 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_28.id,
  name: "target_node_id",
  value: <<EOS.chomp,
#{@cms_nodes_10.id}
EOS
)
@cms_piece_settings_34 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_31.id,
  name: "target_node_id",
  value: <<EOS.chomp,
#{@cms_nodes_10.id}
EOS
)
@cms_piece_settings_35 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_33.id,
  name: "category_id",
  value: ""
)
@cms_piece_settings_36 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_33.id,
  name: "category_type_id",
  value: ""
)
@cms_piece_settings_37 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_33.id,
  name: "layer",
  value: <<EOS.chomp,
descendants
EOS
)
@cms_piece_settings_38 ||= Cms::PieceSetting.create!(
  piece_id: @cms_pieces_33.id,
  name: "setting_state",
  value: <<EOS.chomp,
disabled
EOS
)
