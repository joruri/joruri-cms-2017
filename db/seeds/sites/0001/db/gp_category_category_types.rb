@gp_category_category_types_0 = GpCategory::CategoryType.new(id: 0)
@gp_category_category_types_2 ||= GpCategory::CategoryType.create!(
  content_id: @cms_contents_2.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "kubun",
  title: "区分",
  sort_no: 10,
  sitemap_state: "visible",
  docs_order: "display_updated_at DESC, updated_at DESC",
  description: ""
)
@gp_category_category_types_1 ||= GpCategory::CategoryType.create!(
  content_id: @cms_contents_2.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "bunya",
  title: "分野",
  sort_no: 20,
  sitemap_state: "visible",
  docs_order: "",
  description: ""
)
@gp_category_category_types_3 ||= GpCategory::CategoryType.create!(
  content_id: @cms_contents_2.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "lifeevent",
  title: "ライフイベント",
  sort_no: 30,
  sitemap_state: "visible",
  docs_order: "display_updated_at DESC, updated_at DESC",
  description: ""
)
@gp_category_category_types_4 ||= GpCategory::CategoryType.create!(
  content_id: @cms_contents_2.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "event",
  title: "イベント情報",
  sort_no: 40,
  sitemap_state: "visible",
  docs_order: "display_updated_at DESC, updated_at DESC",
  description: ""
)
