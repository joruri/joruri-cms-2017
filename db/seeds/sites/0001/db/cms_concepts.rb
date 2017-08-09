@cms_concepts_0 = Cms::Concept.new(id: 0)
@cms_concepts_1 ||= Cms::Concept.create!(
  parent_id: @cms_concepts_0.id,
  site_id: @cms_sites_1.id,
  state: "public",
  level_no: 1,
  sort_no: 1,
  name: "じょうるり市"
)
@cms_concepts_2 ||= Cms::Concept.create!(
  parent_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  level_no: 2,
  sort_no: 10,
  name: "トップページ"
)
@cms_concepts_3 ||= Cms::Concept.create!(
  parent_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  level_no: 2,
  sort_no: 100,
  name: "市長の部屋"
)
@cms_concepts_4 ||= Cms::Concept.create!(
  parent_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  level_no: 2,
  sort_no: 200,
  name: "議会事務局"
)
@cms_concepts_5 ||= Cms::Concept.create!(
  parent_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  level_no: 2,
  sort_no: 20,
  name: "カテゴリ"
)
@cms_concepts_6 ||= Cms::Concept.create!(
  parent_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  level_no: 2,
  sort_no: 30,
  name: "組織"
)
