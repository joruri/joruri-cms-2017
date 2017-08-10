@organization_groups_0 = Organization::Group.new(id: 0)
@organization_groups_2 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "soumu",
  sys_group_code: "01001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10,
  business_outline: <<EOS.chomp,
<p>市議会の招集・議案、条例・規則等の審査・整理、行政手続制度、選挙管理委員会・固定資産評価審査委員会との連絡調整等、情報公開及び個人情報保護制度、職員の任免・服務その他、職員の採用の試験・選考等、職員の安全・健康管理</p>\r

EOS
  contact_information: <<EOS.chomp,
<p><strong>総務部　総務課</strong><br />\r
住所：じょうるり県じょうるり市じょうるり町11番地1<br />\r
TEL：0000-00-0000<br />\r
FAX：0000-00-0001<br />\r
E-Mail：sample@joruri.org</p>\r

EOS
  outline: <<EOS.chomp,
<p>総務課は、主に法制や文書管理などの業務を主に担当しています。また、個人情報保護制度及び情報公開制度ならびに市制施行証明書発行の窓口となっています。</p>\r

EOS
)
@organization_groups_1 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "somu",
  sys_group_code: "1",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_8 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "itsuishinka",
  sys_group_code: "2001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_45 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kokusaikoryu",
  sys_group_code: "2006",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_14 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "shimin",
  sys_group_code: "3001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_18 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kankyoseisaku",
  sys_group_code: "4001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_22 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kosodateshien",
  sys_group_code: "5001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_29 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "gesuido",
  sys_group_code: "6001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_35 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "shoko",
  sys_group_code: "7001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_39 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "shobo-somu",
  sys_group_code: "8001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 10
)
@organization_groups_3 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "shokuin",
  sys_group_code: "1001",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_7 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kikaku",
  sys_group_code: "2",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_9 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kikakukeiei",
  sys_group_code: "2002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_15 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "zeimu",
  sys_group_code: "3002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_19 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "seikatsukeizai",
  sys_group_code: "4002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_23 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "chiikifukushi",
  sys_group_code: "5002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_30 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "doboku",
  sys_group_code: "6002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_36 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "norinsuisan",
  sys_group_code: "7002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_40 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "yobo",
  sys_group_code: "8002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 20,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_4 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "keiyakukanri",
  sys_group_code: "1002",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_10 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "zaisei",
  sys_group_code: "2003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_13 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "seikatsu",
  sys_group_code: "3",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_16 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "hoken",
  sys_group_code: "3003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_20 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "anzenanshin",
  sys_group_code: "4003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_24 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "koreishashien",
  sys_group_code: "5003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_31 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kenchikujyutaku",
  sys_group_code: "6003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_37 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kankoshinko",
  sys_group_code: "7003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_41 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "shobosho",
  sys_group_code: "8003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 30,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_5 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "bosai",
  sys_group_code: "1003",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 40,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_11 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "hishokoho",
  sys_group_code: "2004",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 40,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_17 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kankyo",
  sys_group_code: "4",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 40,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_25 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "seikatsufukushika",
  sys_group_code: "5004",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 40,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_32 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "dorokotsu",
  sys_group_code: "6004",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 40,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_6 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "homu",
  sys_group_code: "1004",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 50,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_12 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "johosuishin",
  sys_group_code: "2005",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 50,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_21 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "hokenfukushi",
  sys_group_code: "5",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 50,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_26 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kenkosuishin",
  sys_group_code: "5005",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 50,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_33 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "toshikeikaku",
  sys_group_code: "6005",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 50,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_27 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "shogaifukushi",
  sys_group_code: "5006",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 60,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_28 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "toshiseibi",
  sys_group_code: "6",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 60,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_34 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kankokeizai",
  sys_group_code: "7",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 70,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_38 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "shobohonbu",
  sys_group_code: "8",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 80,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_42 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "gikaijimukyoku",
  sys_group_code: "9",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 90,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_43 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "senkyokanriiinkaijimukyoku",
  sys_group_code: "10",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 100,
  business_outline: "",
  contact_information: "",
  outline: ""
)
@organization_groups_44 ||= Organization::Group.create!(
  content_id: @cms_contents_5.id,
  state: "public",
  name: "kansaiinjimukyoku",
  sys_group_code: "11",
  sitemap_state: "visible",
  docs_order: "",
  sort_no: 110,
  business_outline: "",
  contact_information: "",
  outline: ""
)
