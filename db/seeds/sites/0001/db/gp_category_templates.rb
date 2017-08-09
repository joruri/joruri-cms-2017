@gp_category_templates_0 = GpCategory::Template.new(id: 0)
@gp_category_templates_3 ||= GpCategory::Template.create!(
  content_id: @cms_contents_2.id,
  name: "bunya-1",
  title: "分野第一階層",
  body: <<EOS.chomp,
[[module/docs_1]]\r
[[module/docs_7]]
EOS
)
@gp_category_templates_4 ||= GpCategory::Template.create!(
  content_id: @cms_contents_2.id,
  name: "lifeevent",
  title: "ライフイベント",
  body: <<EOS.chomp,
[[module/docs_2-lifeevent]]
EOS
)
@gp_category_templates_5 ||= GpCategory::Template.create!(
  content_id: @cms_contents_2.id,
  name: "kubun",
  title: "区分",
  body: <<EOS.chomp,
[[module/docs_1]]
EOS
)
@gp_category_templates_6 ||= GpCategory::Template.create!(
  content_id: @cms_contents_2.id,
  name: "event",
  title: "イベント情報",
  body: <<EOS.chomp,
[[module/docs_1]]
EOS
)
@gp_category_templates_7 ||= GpCategory::Template.create!(
  content_id: @cms_contents_2.id,
  name: "bunya-2",
  title: "分野第二階層",
  body: <<EOS.chomp,
[[module/docs_1]]\r
[[module/docs_2]]
EOS
)
