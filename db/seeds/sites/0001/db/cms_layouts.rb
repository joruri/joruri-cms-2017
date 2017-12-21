@cms_layouts_0 = Cms::Layout.new(id: 0)
@cms_layouts_1 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_2.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "top",
  title: "トップページ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/keyvisual]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="top">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
<div id="topContent">\r
<div class="containerBlock">\r
[[piece/about]]\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
</div>\r
\r
<div class="containerBlock">\r
[[piece/recent-docs-tab]]\r
[[piece/calendar]]\r
[[piece/todays-event]]\r
[[piece/relation-link]]\r
[[piece/sns-banner]]\r
\r
</div>\r
</div>\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_2 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "general-2column",
  title: "汎用２カラム",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_3 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "general-1column",
  title: "汎用１カラム",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col1">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_4 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "docs",
  title: "記事ページ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
[[piece/back-btn]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_5 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "docs-list",
  title: "記事一覧",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/archive]]\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_7 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "category",
  title: "カテゴリ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/category-list]]\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_8 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "global-navi",
  title: "グローバルナビ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_9 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "faq-list",
  title: "FAQ一覧",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_10 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "faq-docs",
  title: "FAQ記事ページ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_11 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_6.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "soshiki",
  title: "組織ページ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
[[piece/soshiki-introduction]]\r
[[piece/soshiki-business]]\r
[[piece/soshiki-address]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/useful-navi]]\r
[[piece/lifeevent-list]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></div>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_12 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "evnet",
  title: "イベント",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/calendar-category-list]]\r
[[piece/calendar]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_13 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "fixed_docs-list",
  title: "定型記事一覧",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/lifeevent-list]]\r
[[piece/use-site]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_14 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "fixed_docs",
  title: "定型記事ページ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
[[piece/back-btn]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/lifeevent-list]]\r
[[piece/use-site]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
@cms_layouts_15 ||= Cms::Layout.create!(
  concept_id: @cms_concepts_1.id,
  site_id: @cms_sites_1.id,
  state: "public",
  name: "404",
  title: "404ページ",
  head: <<EOS.chomp,
[[text/meta]]\r
[[text/common-css]]\r
[[text/common-js]]\r
[[text/analytics]]
EOS
  body: <<EOS.chomp,
<div id="container">\r
\r
<header id="pageHeader">\r
<div id="pageHeaderContainer">\r
<div id="pageHeaderBody">\r
\r
[[piece/accessibility-tool]]\r
[[piece/common-header]]\r
\r
</div>\r
<!-- end #pageHeaderContainer --></div>\r
<!-- end #pageHeader --></header>\r
\r
<nav id="pageNav">\r
<div id="pageNavContainer">\r
<div id="pageNavBody">\r
\r
[[piece/global-navi]]\r
[[piece/bread-crumbs]]\r
\r
</div>\r
<!-- end #pageNavContainer --></div>\r
<!-- end #pageNav --></nav>\r
\r
<div id="main">\r
<div id="mainContainer">\r
\r
<div id="wrapper" class="col2">\r
\r
<div id="content">\r
<div id="contentContainer">\r
<div id="contentBody">\r
\r
[[piece/page-title]]\r
[[content]]\r
\r
</div>\r
<!-- end #contentContainer --></div>\r
<!-- end #content --></div>\r
\r
<aside id="links">\r
<div id="linksContainer">\r
<div id="linksBody">\r
\r
[[piece/use-site]]\r
\r
</div>\r
<!-- end #linksContainer --></div>\r
<!-- end #links --></aside>\r
\r
<!-- end #wrapper --></div>\r
\r
[[piece/ad-banner-lower]]\r
\r
<!-- end #mainContainer --></div>\r
<!-- end #main --></div>\r
\r
<footer id="pageFooter">\r
<div id="pageFooterContainer">\r
<div id="pageFooterBody">\r
\r
[[piece/footer-navi]]\r
[[piece/common-footer]]\r
[[piece/copyright]]\r
\r
</div>\r
<!-- end #pageFooterContainer --></div>\r
<!-- end #pageFooter --></footer>\r
\r
[[piece/page-top]]\r
\r
</div>
EOS
  mobile_head: "",
  mobile_body: "",
  smart_phone_head: "",
  smart_phone_body: ""
)
