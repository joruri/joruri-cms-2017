@ad_banner_groups_0 = AdBanner::Group.new(id: 0)
@ad_banner_groups_1 ||= AdBanner::Group.create!(
  content_id: @cms_contents_8.id,
  name: "keyvisual",
  title: "キービジュアル",
  sort_no: 10
)
@ad_banner_groups_2 ||= AdBanner::Group.create!(
  content_id: @cms_contents_8.id,
  name: "ad-banner-lower",
  title: "広告バナー（下部）",
  sort_no: 20
)
@ad_banner_groups_3 ||= AdBanner::Group.create!(
  content_id: @cms_contents_8.id,
  name: "ad-banner-side",
  title: "広告バナー（サイド）",
  sort_no: 30
)
