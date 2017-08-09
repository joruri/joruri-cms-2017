@cms_contents_0 = Cms::Content.new(id: 0)
@cms_contents_1 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "GpArticle::Doc",
  name: "記事",
  note: "",
  code: "doc",
  sort_no: 10
)
@cms_contents_2 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "GpCategory::CategoryType",
  name: "カテゴリ",
  note: "",
  code: "category",
  sort_no: 40
)
@cms_contents_3 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "Tag::Tag",
  name: "関連ワード",
  note: "",
  code: "tag",
  sort_no: 60
)
@cms_contents_4 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "Approval::ApprovalFlow",
  name: "承認フロー",
  note: "",
  code: "approval_flow",
  sort_no: 70
)
@cms_contents_5 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "Organization::Group",
  name: "組織",
  note: "",
  code: "unit",
  sort_no: 80
)
@cms_contents_6 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "Survey::Form",
  name: "お問い合わせフォーム",
  note: "",
  code: "form",
  sort_no: 90
)
@cms_contents_7 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "GpCalendar::Event",
  name: "カレンダー",
  note: "",
  code: "calendar",
  sort_no: 50
)
@cms_contents_7.becomes(GpCalendar::Content::Event).send(:create_default_holidays)
@cms_contents_8 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "AdBanner::Banner",
  name: "広告バナー",
  note: "キービジュアルと広告バナーを管理",
  code: "ad_banner",
  sort_no: 100
)
@cms_contents_9 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "Gnav::MenuItem",
  name: "グローバルナビ",
  note: "",
  code: "navi",
  sort_no: 110
)
@cms_contents_10 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "GpArticle::Doc",
  name: "よくある質問",
  note: "",
  code: "faq",
  sort_no: 30
)
@cms_contents_11 ||= Cms::Content.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  model: "GpArticle::Doc",
  name: "定型記事",
  note: "",
  code: "fixed_docs",
  sort_no: 20
)
