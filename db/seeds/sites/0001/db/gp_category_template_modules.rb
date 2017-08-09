@gp_category_template_modules_0 = GpCategory::TemplateModule.new(id: 0)
@gp_category_template_modules_4 ||= GpCategory::TemplateModule.create!(
  content_id: @cms_contents_2.id,
  name: "docs_7",
  title: "記事一覧：自カテゴリ直下のカテゴリ（カテゴリで分類）",
  module_type: "docs_7",
  module_type_feature: <<EOS.chomp,
---
- #{@cms_contents_11.id}

EOS
  wrapper_tag: "li",
  doc_style: "@title_link@",
  num_docs: 10,
  upper_text: "",
  lower_text: ""
)
@gp_category_template_modules_5 ||= GpCategory::TemplateModule.create!(
  content_id: @cms_contents_2.id,
  name: "docs_1",
  title: "記事一覧：自カテゴリ以下全て",
  module_type: "docs_1",
  module_type_feature: <<EOS.chomp,
---
- #{@cms_contents_1.id}

EOS
  wrapper_tag: "li",
  doc_style: "@title_link@（@update_date@ @group@）",
  num_docs: 1,
  upper_text: "<div class=\"articleHeader\"><h2>新着情報</h2></div>\r\n<ul class=\"feed\">\r\n  <li><a class=\"feedRss\" title=\"RSSフィードを取得\" href=\"index.rss\">RSS</a></li>\r\n  <li><a class=\"feedAtom\" title=\"Atomフィードを取得\" href=\"index.atom\">Atom</a></li>\r\n</ul>",
  lower_text: ""
)
@gp_category_template_modules_6 ||= GpCategory::TemplateModule.create!(
  content_id: @cms_contents_2.id,
  name: "docs_2",
  title: "記事一覧：自カテゴリのみ",
  module_type: "docs_2",
  module_type_feature: <<EOS.chomp,
---
- #{@cms_contents_11.id}

EOS
  wrapper_tag: "li",
  doc_style: "@title_link@",
  num_docs: 100,
  upper_text: "",
  lower_text: ""
)
@gp_category_template_modules_7 ||= GpCategory::TemplateModule.create!(
  content_id: @cms_contents_2.id,
  name: "docs_2-lifeevent",
  title: "記事一覧：自カテゴリ以下全て（ライフイベント）",
  module_type: "docs_1",
  module_type_feature: <<EOS.chomp,
--- []

EOS
  wrapper_tag: "li",
  doc_style: "@title_link@",
  num_docs: 100,
  upper_text: "",
  lower_text: ""
)
