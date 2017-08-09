@cms_nodes_0 = Cms::Node.new(id: 0)
@cms_nodes_1 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_0.id,
  route_id: @cms_nodes_0.id,
  model: "Cms::Directory",
  directory: 1,
  name: "/",
  title: "じょうるり市",
  sitemap_state: "visible"
)
@cms_sites_1.node_id = @cms_nodes_1.id
@cms_sites_1.save!
@cms_nodes_2 ||= Cms::Node.create!(
  concept_id: @cms_concepts_2.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  model: "Cms::Page",
  directory: 0,
  layout_id: @cms_layouts_1.id,
  name: "index.html",
  title: "じょうるり市",
  body: "",
  mobile_title: "",
  mobile_body: "",
  sitemap_state: "hidden"
)
@cms_nodes_3 ||= Cms::Node.create!(
  concept_id: @cms_concepts_2.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_8.id,
  model: "AdBanner::Banner",
  directory: 1,
  name: "banner",
  title: "広告バナー",
  sitemap_state: "hidden"
)
@cms_nodes_4 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_1.id,
  model: "GpArticle::Doc",
  directory: 1,
  layout_id: @cms_layouts_5.id,
  name: "docs",
  title: "新着情報",
  sitemap_state: "visible",
  sitemap_sort_no: 30
)
@cms_nodes_5 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_1.id,
  model: "GpArticle::Archive",
  directory: 1,
  layout_id: @cms_layouts_5.id,
  name: "archive",
  title: "アーカイブ",
  sitemap_state: "hidden"
)
@cms_nodes_7 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_10.id,
  model: "GpArticle::Doc",
  directory: 1,
  layout_id: @cms_layouts_9.id,
  name: "faq",
  title: "よくある質問",
  sitemap_state: "visible",
  sitemap_sort_no: 50
)
@cms_nodes_8 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_10.id,
  model: "GpArticle::SearchDoc",
  directory: 1,
  name: "faq-search",
  title: "よくある質問検索結果",
  sitemap_state: "hidden"
)
@cms_nodes_9 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_2.id,
  model: "GpCategory::CategoryType",
  directory: 1,
  layout_id: @cms_layouts_7.id,
  name: "categories",
  title: "カテゴリ",
  sitemap_state: "visible",
  sitemap_sort_no: 20
)
@cms_nodes_10 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_7.id,
  model: "GpCalendar::Event",
  directory: 1,
  layout_id: @cms_layouts_12.id,
  name: "event_list",
  title: "イベント一覧",
  sitemap_state: "visible",
  sitemap_sort_no: 60
)
@cms_nodes_11 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_3.id,
  model: "Tag::Tag",
  directory: 1,
  layout_id: @cms_layouts_4.id,
  name: "tags",
  title: "関連ワード",
  sitemap_state: "hidden"
)
@cms_nodes_12 ||= Cms::Node.create!(
  concept_id: @cms_concepts_6.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_5.id,
  model: "Organization::Group",
  directory: 1,
  layout_id: @cms_layouts_11.id,
  name: "soshiki",
  title: "組織",
  sitemap_state: "visible",
  sitemap_sort_no: 40
)
@cms_nodes_13 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_6.id,
  model: "Survey::Form",
  directory: 1,
  layout_id: @cms_layouts_3.id,
  name: "contact",
  title: "お問い合わせフォーム",
  sitemap_state: "visible",
  sitemap_sort_no: 70
)
@cms_nodes_14 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_9.id,
  model: "Gnav::MenuItem",
  directory: 1,
  layout_id: @cms_layouts_8.id,
  name: "navi",
  title: "ナビ",
  sitemap_state: "visible",
  sitemap_sort_no: 10
)
@cms_nodes_15 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  model: "Cms::Sitemap",
  directory: 0,
  layout_id: @cms_layouts_3.id,
  name: "sitemap.html",
  title: "サイトマップ",
  sitemap_state: "hidden"
)
@cms_nodes_16 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  model: "Cms::Page",
  directory: 0,
  layout_id: @cms_layouts_15.id,
  name: "404.html",
  title: "404 Not Found",
  body: <<EOS.chomp,
<h2>ご指定のページまたはファイルが見つかりませんでした</h2>\r
\r
<p>ご不便をおかけして申し訳ありませんが、ご指定のURLのページまたはファイルが見つかりませんでした。</p>\r
\r
<p>お探しのページまたはファイルは、</p>\r
\r
<ul>\r
	<li>URLが変更された</li>\r
	<li>ページが削除された（公開期間を過ぎた等の理由）</li>\r
	<li>URLの入力誤り（リンク元ページのURL記述の誤り）</li>\r
</ul>\r
\r
<p>などの理由で表示することができません。</p>\r
\r
<p>お手数をおかけしますが、以下のいずれかの方法で情報をお探しください。</p>\r
\r
<ul>\r
	<li><a href="/">トップページ</a>から探す</li>\r
	<li>このページ上の「サイト内検索」ボックスから探す</li>\r
	<li><a href="/sitemap.html">サイトマップ</a>から探す</li>\r
</ul>\r

EOS
  mobile_title: "",
  mobile_body: "",
  sitemap_state: "hidden"
)
@cms_nodes_17 ||= Cms::Node.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  published_at: Time.now,
  parent_id: @cms_nodes_1.id,
  route_id: @cms_nodes_1.id,
  content_id: @cms_contents_11.id,
  model: "GpArticle::Doc",
  directory: 1,
  layout_id: @cms_layouts_13.id,
  name: "fixed_docs",
  title: "定型記事",
  sitemap_state: "hidden"
)
