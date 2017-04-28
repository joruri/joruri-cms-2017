Gnav::CategorySet.create!([
  {id: 1, menu_item_id: 1, category_id: 31, layer: "descendants"},
  {id: 2, menu_item_id: 1, category_id: 29, layer: "descendants"},
  {id: 3, menu_item_id: 1, category_id: 27, layer: "descendants"},
  {id: 4, menu_item_id: 1, category_id: 24, layer: "descendants"},
  {id: 5, menu_item_id: 1, category_id: 23, layer: "descendants"},
  {id: 8, menu_item_id: 2, category_id: 28, layer: "descendants"},
  {id: 9, menu_item_id: 2, category_id: 26, layer: "descendants"},
  {id: 10, menu_item_id: 3, category_id: 26, layer: "descendants"},
  {id: 11, menu_item_id: 3, category_id: 25, layer: "descendants"},
  {id: 12, menu_item_id: 4, category_id: 36, layer: "descendants"},
  {id: 13, menu_item_id: 4, category_id: 37, layer: "descendants"},
  {id: 14, menu_item_id: 3, category_id: 43, layer: "descendants"},
  {id: 15, menu_item_id: 5, category_id: 32, layer: "descendants"},
  {id: 16, menu_item_id: 5, category_id: 34, layer: "descendants"},
  {id: 17, menu_item_id: 6, category_id: 35, layer: "descendants"},
  {id: 18, menu_item_id: 6, category_id: 33, layer: "descendants"},
  {id: 19, menu_item_id: 6, category_id: 41, layer: "descendants"},
  {id: 20, menu_item_id: 6, category_id: 40, layer: "descendants"},
  {id: 21, menu_item_id: 6, category_id: 39, layer: "descendants"},
  {id: 22, menu_item_id: 6, category_id: 42, layer: "descendants"},
  {id: 23, menu_item_id: 1, category_id: 30, layer: "descendants"}
])
Gnav::MenuItem.create!([
  {id: 1, content_id: 9, concept_id: nil, state: "public", name: "kurashi", title: "暮らしのガイド", sort_no: 10, layout_id: nil, sitemap_state: "visible"},
  {id: 2, content_id: 9, concept_id: nil, state: "public", name: "kosodate", title: "子育て・教育", sort_no: 20, layout_id: nil, sitemap_state: "visible"},
  {id: 3, content_id: 9, concept_id: nil, state: "public", name: "kenko", title: "健康・福祉", sort_no: 30, layout_id: nil, sitemap_state: "visible"},
  {id: 4, content_id: 9, concept_id: nil, state: "public", name: "kanko", title: "観光・文化", sort_no: 40, layout_id: nil, sitemap_state: "visible"},
  {id: 5, content_id: 9, concept_id: nil, state: "public", name: "jigyosha", title: "事業者の方へ", sort_no: 50, layout_id: nil, sitemap_state: "visible"},
  {id: 6, content_id: 9, concept_id: nil, state: "public", name: "shisei", title: "市政情報", sort_no: 60, layout_id: nil, sitemap_state: "visible"}
])
