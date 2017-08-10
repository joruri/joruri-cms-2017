@gnav_menu_items_0 = Gnav::MenuItem.new(id: 0)
@gnav_menu_items_1 ||= Gnav::MenuItem.create!(
  content_id: @cms_contents_9.id,
  state: "public",
  name: "kurashi",
  title: "暮らしのガイド",
  sort_no: 10,
  sitemap_state: "visible"
)
@gnav_menu_items_2 ||= Gnav::MenuItem.create!(
  content_id: @cms_contents_9.id,
  state: "public",
  name: "kosodate",
  title: "子育て・教育",
  sort_no: 20,
  sitemap_state: "visible"
)
@gnav_menu_items_3 ||= Gnav::MenuItem.create!(
  content_id: @cms_contents_9.id,
  state: "public",
  name: "kenko",
  title: "健康・福祉",
  sort_no: 30,
  sitemap_state: "visible"
)
@gnav_menu_items_4 ||= Gnav::MenuItem.create!(
  content_id: @cms_contents_9.id,
  state: "public",
  name: "kanko",
  title: "観光・文化",
  sort_no: 40,
  sitemap_state: "visible"
)
@gnav_menu_items_5 ||= Gnav::MenuItem.create!(
  content_id: @cms_contents_9.id,
  state: "public",
  name: "jigyosha",
  title: "事業者の方へ",
  sort_no: 50,
  sitemap_state: "visible"
)
@gnav_menu_items_6 ||= Gnav::MenuItem.create!(
  content_id: @cms_contents_9.id,
  state: "public",
  name: "shisei",
  title: "市政情報",
  sort_no: 60,
  sitemap_state: "visible"
)
