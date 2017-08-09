@cms_pieces_0 = Cms::Piece.new(id: 0)
@cms_pieces_1 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::PageTitle",
  name: "page-title",
  title: "ページタイトル",
  view_title: "",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_2 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::BreadCrumb",
  name: "bread-crumbs",
  title: "パンくず",
  view_title: "",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_3 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "back-btn",
  title: "戻るボタン",
  view_title: "",
  body: <<EOS.chomp,
<div class="back">\r
<a href="javascript:history.back();">戻る</a>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_4 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "copyright",
  title: "コピーライト",
  view_title: "",
  body: <<EOS.chomp,
<div id="copyright" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
\r
<small>&copy;2017 [[text/site-name-en]]</small>\r
\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_5 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_2.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_8.id,
  model: "AdBanner::Banner",
  name: "keyvisual",
  title: "キービジュアル",
  view_title: "",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_6 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_2.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_1.id,
  model: "GpArticle::RecentTab",
  name: "recent-docs-tab",
  title: "新着タブ",
  view_title: "",
  xml_properties: <<EOS.chomp,
<xml><tabs><tab condition='and' more='/docs/' name='shinchaku' sort_no='10' title='新着情報'><elem_layers>0_descendants</elem_layers></tab><tab condition='or' more='/categories/bunya/nyusatsu/' name='nyusatsu' sort_no='30' title='入札・契約'><elem_category_ids>#{@gp_category_categories_32.id}</elem_category_ids><elem_layers>0_descendants</elem_layers><elem_layers>1_descendants</elem_layers></tab><tab condition='or' more='/categories/kubun/boshu/' name='boshu' sort_no='40' title='募集'><elem_category_ids>#{@gp_category_categories_12.id}</elem_category_ids><elem_layers>0_descendants</elem_layers><elem_layers>1_descendants</elem_layers></tab><tab condition='or' more='/event_list/' name='event' sort_no='20' title='イベント'><elem_category_ids>#{@gp_category_categories_4.id}</elem_category_ids><elem_category_ids>#{@gp_category_categories_5.id}</elem_category_ids><elem_category_ids>#{@gp_category_categories_6.id}</elem_category_ids><elem_category_ids>#{@gp_category_categories_7.id}</elem_category_ids><elem_category_ids>#{@gp_category_categories_8.id}</elem_category_ids><elem_layers>0_descendants</elem_layers><elem_layers>1_descendants</elem_layers><elem_layers>2_descendants</elem_layers><elem_layers>3_descendants</elem_layers><elem_layers>4_descendants</elem_layers><elem_layers>5_descendants</elem_layers></tab></tabs></xml>
EOS
  etcetera: ""
)
@cms_pieces_9 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_1.id,
  model: "GpArticle::SearchDoc",
  name: "faq-search",
  title: "よくある質問検索フォーム",
  view_title: "",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_10 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "accessibility-tool",
  title: "ふりがな・よみあげヘッダー",
  view_title: "",
  body: <<EOS.chomp,
<!-- skip reading -->\r
<div id="accessibilityTool" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
\r
<a id="nocssread" href="#main">本文へ</a>\r
\r
<div class="tools clearfix">\r
<ul>\r
  <li><a href="#navigationRuby" id="navigationRuby">ふりがなをつける</a></li>\r
  <li><a href="#navigationTalk" id="navigationTalk">よみあげる</a><span id="navigationTalkPlayer"></span></li>\r
  <li>文字の大きさ\r
  <ul class="fontSize">\r
    <li><a href="#fontLarge" id="fontLarge" title="文字のサイズを大きくする">拡大</a></li>\r
    <li><a href="#fontMiddle" id="fontMiddle" title="標準の文字サイズに戻す">標準</a></li>\r
    <li><a href="#fontSmall" id="fontSmall" title="文字のサイズを小さくする">縮小</a></li>\r
  </ul>\r
  </li>\r
  <li>背景色\r
  <ul class="themeColor">\r
    <li><a href="#themeBlack" id="themeBlack" title="背景色を黒にする" class="black">黒</a></li>\r
    <li><a href="#themeBlue" id="themeBlue" title="背景色を青にする" class="blue">青</a></li>\r
    <li><a href="#themeWhite" id="themeWhite" title="背景色を元に戻す" class="white">標準</a></li>\r
  </ul>\r
  </li>\r
</ul>\r
\r
<div id="google_translate_element"></div>\r
<script>\r
  function googleTranslateElementInit() {\r
  new google.translate.TranslateElement({pageLanguage: 'ja', includedLanguages: 'en,ko,zh-CN,zh-TW', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');\r
}\r
</script>\r
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>\r
\r
</div>\r
</div>\r
</div>\r
</div>\r
<!-- /skip reading -->
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_11 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "common-header",
  title: "共通ヘッダー",
  view_title: "",
  body: <<EOS.chomp,
<div id="commonHeader" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
<h1><a href="/"><img src="/_files/00000017/header-id.gif" alt="じょうるり市" title="じょうるり市" /></a></h1>\r
\r
<div class="menu">\r
<div id="cse-search-box">\r
  <form action="https://www.google.com/search">\r
    <input type="hidden" value="ja" name="hl" />\r
    <input type="hidden" name="domains" value="demo.cms2017.joruri.org" />\r
    <input type="hidden" name="sitesearch" value="demo.cms2017.joruri.org" />\r
    <input type="text" title="サイト内検索" placeholder="サイト内検索" class="text" id="search-box" size="40" name="q" />\r
    <input type="submit" id="search-button" value="検索" name="sa" />\r
  </form>\r
  <a href="/fixed_docs/search/">検索方法</a>\r
</div>\r
\r
<ul>\r
<li><a href="/faq/">よくある質問</a></li>\r
<li><a href="/categories/bunya/shisetsu/">施設案内</a></li>\r
<li><a href="/event_list/">イベント一覧</a></li>\r
<li><a href="/soshiki/">組織一覧</a></li>\r
</ul>\r
</div>\r
\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_12 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "footer-navi",
  title: "フッターナビ",
  view_title: "",
  body: <<EOS.chomp,
<div id="footerNavi" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
<ul>\r
<li><a href="/fixed_docs/about-site/">サイトの利用について</a></li>\r
<li><a href="/fixed_docs/privacy/">個人情報の取扱い</a></li>\r
<li><a href="/fixed_docs/link/">リンク</a></li>\r
<li><a href="/fixed_docs/copyright/">著作権・免責事項</a></li>\r
<li><a href="/fixed_docs/webaccessibility/">ウェブアクセシビリティ</a></li>\r
</ul>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_13 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "global-navi",
  title: "グローバルナビ",
  view_title: "",
  body: <<EOS.chomp,
<div id="globalNavi" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
<ul>\r
<li><a href="/">ホーム</a></li>\r
<li><a href="/navi/kurashi/">暮らしのガイド</a></li>\r
<li><a href="/navi/kosodate/">子育て・教育</a></li>\r
<li><a href="/navi/kenko/">健康・福祉</a></li>\r
<li><a href="/navi/kanko/">観光・文化</a></li>\r
<li><a href="/navi/jigyosha/">事業者の方へ</a></li>\r
<li><a href="/navi/shisei/">市政情報</a></li>\r
</ul>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_15 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_2.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_8.id,
  model: "AdBanner::Banner",
  name: "ad-banner-lower",
  title: "広告バナー（下部）",
  view_title: "広告",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_17 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "useful-navi",
  title: "便利情報ナビ",
  view_title: "",
  body: <<EOS.chomp,
<div id="usefulNavi" class="piece">\r
<div class="pieceHeader"><h2>便利情報ナビ</h2></div>\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
<ul>\r
<li class="bosai"><a href="#">防災情報</a></li>\r
<li class="shinryo"><a href="#">休日・夜間<br />診療案内</a></li>\r
<li class="download"><a href="#">申請書<br />ダウンロード</a></li>\r
<li class="gomi"><a href="#">ごみの出し方</a></li>\r
<li class="koho"><a href="#">広報誌</a></li>\r
<li class="faq"><a href="/faq/">よくある質問</a></li>\r
<li class="link"><a href="#">リンク集</a></li>\r
<li class="reiki"><a href="#">例規集</a></li>\r
</ul>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_18 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_2.id,
  model: "GpCategory::CategoryList",
  name: "lifeevent-list",
  title: "ライフイベント一覧",
  view_title: "ライフイベント",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_19 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "about",
  title: "じょうるり市について",
  view_title: "",
  body: <<EOS.chomp,
<div id="about" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceHeader"><h2>じょうるり市について</h2></div>\r
<div class="pieceBody">\r
<ul>\r
<li class="profile"><a href="/categories/bunya/shisei/shokai/">市の紹介</a></li>\r
<li class="mayor"><a href="#">市長の部屋</a></li>\r
<li class="gikai"><a href="#">市議会</a></li>\r
<li class="event"><a href="/event_list/">イベント</a></li>\r
<li class="shisetsu"><a href="/categories/bunya/shisetsu/">施設案内</a></li>\r
<li class="annai"><a href="#">窓口案内</a></li>\r
<li class="access"><a href="/fixed_docs/access/">交通アクセス</a></li>\r
<li class="iken"><a href="/contact/goiken">ご意見・ご提案</a></li>\r
</ul>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_20 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "relation-link",
  title: "関連リンク",
  view_title: "",
  body: <<EOS.chomp,
<div id="relationLink" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceHeader"><h2>関連リンク</h2></div>\r
<div class="pieceBody">\r
<ul>\r
<li class="kyoiku"><a href="#">教育委員会</a></li>\r
<li class="library"><a href="#">図書館</a></li>\r
<li class="kanko"><a href="#">観光情報</a></li>\r
<li class="furusato"><a href="#">ふるさと納税</a></li>\r
<li class="denshi"><a href="#">電子申請</a></li>\r
</ul>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_21 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_2.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "sns-banner",
  title: "SNSバナー",
  view_title: "",
  body: <<EOS.chomp,
<div id="snsBanner" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
<ul>\r
<li class="facebook"><a href="https://www.facebook.com/JoruriProject" target="_blank">[[text/site-name]]Facebook</a></li>\r
<li class="twitter"><a href="https://twitter.com/joruri_org" target="_blank">[[text/site-name]]Twitter</a></li>\r
</ul>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_22 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "page-top",
  title: "ページの先頭へ戻る",
  view_title: "",
  body: <<EOS.chomp,
<div id="pageTop">\r
<a href="#top">このページの<br />先頭へ戻る</a>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_23 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "common-footer",
  title: "共通フッター",
  view_title: "",
  body: <<EOS.chomp,
<div id="commonFooter" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceBody">\r
\r
<div class="information">\r
<b>[[text/site-name]]役所</b>\r
<ul>\r
<li><a href="/categories/bunya/shisetsu/shiyakusho/">市役所のご案内</a></li>\r
<li><a href="/sitemap.html">サイトマップ</a></li>\r
<li><a href="/contact/toiawase">お問い合わせ</a></li>\r
</ul>\r
</div>\r
<address>\r
〒000-0000 じょうるり県じょうるり市じょうるり町11番地1<br />\r
TEL：000-000-0000（代表）　FAX：000-00-0001<br />\r
開庁時間：8時30分から17時30分（土日祝日および12月29日から1月3日を除く）\r
</address>\r
<div class="map">[[file/joruricity-map.png]]</div>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_24 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_1.id,
  model: "GpArticle::Archive",
  name: "archive",
  title: "アーカイブ",
  view_title: "アーカイブ",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_25 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_6.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_5.id,
  model: "Organization::BusinessOutline",
  name: "soshiki-business",
  title: "業務内容",
  view_title: "主な業務",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_26 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_6.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_5.id,
  model: "Organization::ContactInformation",
  name: "soshiki-address",
  title: "連絡先",
  view_title: "連絡先",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_27 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_6.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_5.id,
  model: "Organization::Outline",
  name: "soshiki-introduction",
  title: "組織概要",
  view_title: "概要",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_28 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_7.id,
  model: "GpCalendar::DailyLink",
  name: "calendar",
  title: "イベントカレンダー",
  view_title: "イベントカレンダー",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_31 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_7.id,
  model: "GpCalendar::CategoryType",
  name: "calendar-category-list",
  title: "カレンダーカテゴリ一覧",
  view_title: "",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_32 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  model: "Cms::Free",
  name: "use-site",
  title: "サイトについて",
  view_title: "",
  body: <<EOS.chomp,
<div id="useSite" class="piece">\r
<div class="pieceContainer">\r
<div class="pieceHeader"><h2>サイトについて</h2></div>\r
<div class="pieceBody">\r
<ul>\r
<li><a href="/fixed_docs/about-site/">サイトの利用について</a></li>\r
<li><a href="/fixed_docs/webaccessibility/">ウェブアクセシビリティ方針</a></li>\r
<li><a href="/fixed_docs/search/">サイト内検索について</a></li>\r
<li><a href="/fixed_docs/rss/">RSS、Atom配信について</a></li>\r
<li><a href="/fixed_docs/link/">リンクについて</a></li>\r
<li><a href="/fixed_docs/privacy/">個人情報の取扱い</a></li>\r
<li><a href="/fixed_docs/copyright/">著作権・免責事項</a></li>\r
<li><a href="/fixed_docs/ad/">広告掲載について</a></li>\r
</ul>\r
</div>\r
</div>\r
</div>
EOS
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_33 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_2.id,
  model: "GpCategory::CategoryList",
  name: "category-list",
  title: "カテゴリ一覧",
  view_title: "分野から探す",
  xml_properties: "",
  etcetera: ""
)
@cms_pieces_34 ||= Cms::Piece.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  content_id: @cms_contents_7.id,
  model: "GpCalendar::NearFutureEvent",
  name: "todays-event",
  title: "本日と明日のイベント",
  view_title: "",
  xml_properties: "",
  etcetera: ""
)
