@cms_data_texts_0 = Cms::DataText.new(id: 0)
@cms_data_texts_1 ||= Cms::DataText.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "analytics",
  title: "トラッキングコード",
  body: <<EOS.chomp,
<!-- トラッキングコードを記入 -->
EOS
)
@cms_data_texts_2 ||= Cms::DataText.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "meta",
  title: "メタタグ",
  body: <<EOS.chomp,
<meta name="viewport" content="width=device-width" />\r
<meta name="format-detection" content="telephone=no" />
EOS
)
@cms_data_texts_3 ||= Cms::DataText.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "common-css",
  title: "共通CSS",
  body: <<EOS.chomp,
<link rel="stylesheet" href="/_themes/css/normalize.css" />\r
<link rel="stylesheet" href="/_themes/css/common.css" />\r
<link rel="stylesheet" href="/_themes/css/site-color/default.css" />\r
<link rel="alternate stylesheet" href="/_themes/css/colors/white.css" title="white" />\r
<link rel="alternate stylesheet" href="/_themes/css/colors/blue.css" title="blue" />\r
<link rel="alternate stylesheet" href="/_themes/css/colors/black.css" title="black" />\r
<link rel="stylesheet" href="/_themes/css/print.css" media="print" />
EOS
)
@cms_data_texts_4 ||= Cms::DataText.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "common-js",
  title: "共通javascript",
  body: <<EOS.chomp,
<script src="/_themes/js/jquery.min.js"></script>\r
<script src="/_themes/js/jquery-migrate.min.js"></script>\r
<script src="/_themes/js/jquery.cookie.min.js"></script>\r
<script src="/_themes/js/navigation.js"></script>\r
<script src="/_themes/js/slick.min.js"></script>\r
<script src="/_themes/js/common.js"></script>
EOS
)
@cms_data_texts_5 ||= Cms::DataText.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "site-name",
  title: "サイト名",
  body: <<EOS.chomp,
じょうるり市
EOS
)
@cms_data_texts_6 ||= Cms::DataText.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  name: "site-name-en",
  title: "サイト名（英語）",
  body: <<EOS.chomp,
Joruri City
EOS
)
