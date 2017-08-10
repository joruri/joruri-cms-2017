@sys_groups_0 = Sys::Group.new(id: 0)
@sys_groups_1 ||= Sys::Group.create!(
  state: "enabled",
  web_state: "closed",
  parent_id: @sys_groups_0.id,
  level_no: 1,
  code: "root",
  sort_no: 1,
  ldap: 0,
  name: "じょうるり市",
  name_en: "top"
)
@sys_groups_3 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "1",
  sort_no: 10,
  ldap: 0,
  name: "総務部",
  name_en: "somu"
)
@sys_groups_9 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "2",
  sort_no: 20,
  ldap: 0,
  name: "企画部",
  name_en: "kikaku"
)
@sys_groups_15 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "3",
  sort_no: 30,
  ldap: 0,
  name: "生活部",
  name_en: "seikatsu"
)
@sys_groups_19 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "4",
  sort_no: 40,
  ldap: 0,
  name: "環境部",
  name_en: "kankyo"
)
@sys_groups_23 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "5",
  sort_no: 50,
  ldap: 0,
  name: "保健福祉部",
  name_en: "hokenfukushi"
)
@sys_groups_30 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "6",
  sort_no: 60,
  ldap: 0,
  name: "都市整備部",
  name_en: "toshiseibi"
)
@sys_groups_36 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "7",
  sort_no: 70,
  ldap: 0,
  name: "観光経済部",
  name_en: "kankokeizai"
)
@sys_groups_40 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "8",
  sort_no: 80,
  ldap: 0,
  name: "消防本部",
  name_en: "shobohonbu"
)
@sys_groups_44 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "9",
  sort_no: 90,
  ldap: 0,
  name: "議会事務局",
  name_en: "gikaijimukyoku"
)
@sys_groups_45 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "10",
  sort_no: 100,
  ldap: 0,
  name: "選挙管理委員会事務局",
  name_en: "senkyokanriiinkaijimukyoku"
)
@sys_groups_46 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_1.id,
  level_no: 2,
  code: "11",
  sort_no: 110,
  ldap: 0,
  name: "監査委員事務局",
  name_en: "kansaiinjimukyoku"
)
@sys_groups_4 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_3.id,
  level_no: 3,
  code: "01001",
  sort_no: 10,
  ldap: 0,
  name: "総務課",
  name_en: "soumu",
  tel: "000-0000",
  email: "sample@joruri.org",
  fax: "000-0001",
  address: "",
  note: "",
  tel_attend: ""
)
@sys_groups_5 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_3.id,
  level_no: 3,
  code: "1001",
  sort_no: 20,
  ldap: 0,
  name: "職員課",
  name_en: "shokuin"
)
@sys_groups_6 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_3.id,
  level_no: 3,
  code: "1002",
  sort_no: 30,
  ldap: 0,
  name: "契約管理課",
  name_en: "keiyakukanri"
)
@sys_groups_7 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_3.id,
  level_no: 3,
  code: "1003",
  sort_no: 40,
  ldap: 0,
  name: "防災課",
  name_en: "bosai"
)
@sys_groups_8 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_3.id,
  level_no: 3,
  code: "1004",
  sort_no: 50,
  ldap: 0,
  name: "法務課",
  name_en: "homu"
)
@sys_groups_10 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_9.id,
  level_no: 3,
  code: "2001",
  sort_no: 10,
  ldap: 0,
  name: "IT推進課",
  name_en: "itsuishinka"
)
@sys_groups_11 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_9.id,
  level_no: 3,
  code: "2002",
  sort_no: 20,
  ldap: 0,
  name: "企画経営課",
  name_en: "kikakukeiei"
)
@sys_groups_12 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_9.id,
  level_no: 3,
  code: "2003",
  sort_no: 30,
  ldap: 0,
  name: "財政課",
  name_en: "zaisei"
)
@sys_groups_13 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_9.id,
  level_no: 3,
  code: "2004",
  sort_no: 40,
  ldap: 0,
  name: "秘書広報課",
  name_en: "hishokoho"
)
@sys_groups_14 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_9.id,
  level_no: 3,
  code: "2005",
  sort_no: 50,
  ldap: 0,
  name: "情報推進課",
  name_en: "johosuishin"
)
@sys_groups_16 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_15.id,
  level_no: 3,
  code: "3001",
  sort_no: 10,
  ldap: 0,
  name: "市民課",
  name_en: "shimin"
)
@sys_groups_17 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_15.id,
  level_no: 3,
  code: "3002",
  sort_no: 20,
  ldap: 0,
  name: "税務課",
  name_en: "zeimu"
)
@sys_groups_18 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_15.id,
  level_no: 3,
  code: "3003",
  sort_no: 30,
  ldap: 0,
  name: "保健課",
  name_en: "hoken"
)
@sys_groups_20 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_19.id,
  level_no: 3,
  code: "4001",
  sort_no: 10,
  ldap: 0,
  name: "環境政策課",
  name_en: "kankyoseisaku"
)
@sys_groups_21 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_19.id,
  level_no: 3,
  code: "4002",
  sort_no: 20,
  ldap: 0,
  name: "生活経済課",
  name_en: "seikatsukeizai"
)
@sys_groups_22 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_19.id,
  level_no: 3,
  code: "4003",
  sort_no: 30,
  ldap: 0,
  name: "安全安心課",
  name_en: "anzenanshin"
)
@sys_groups_24 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_23.id,
  level_no: 3,
  code: "5001",
  sort_no: 10,
  ldap: 0,
  name: "子育て支援課",
  name_en: "kosodateshien"
)
@sys_groups_25 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_23.id,
  level_no: 3,
  code: "5002",
  sort_no: 20,
  ldap: 0,
  name: "地域福祉課",
  name_en: "chiikifukushi"
)
@sys_groups_26 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_23.id,
  level_no: 3,
  code: "5003",
  sort_no: 30,
  ldap: 0,
  name: "高齢者支援課",
  name_en: "koreishashien"
)
@sys_groups_27 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_23.id,
  level_no: 3,
  code: "5004",
  sort_no: 40,
  ldap: 0,
  name: "生活福祉課",
  name_en: "seikatsufukushika"
)
@sys_groups_28 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_23.id,
  level_no: 3,
  code: "5005",
  sort_no: 50,
  ldap: 0,
  name: "健康推進課",
  name_en: "kenkosuishin"
)
@sys_groups_29 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_23.id,
  level_no: 3,
  code: "5006",
  sort_no: 60,
  ldap: 0,
  name: "障害福祉課",
  name_en: "shogaifukushi"
)
@sys_groups_31 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_30.id,
  level_no: 3,
  code: "6001",
  sort_no: 10,
  ldap: 0,
  name: "下水道課",
  name_en: "gesuido"
)
@sys_groups_32 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_30.id,
  level_no: 3,
  code: "6002",
  sort_no: 20,
  ldap: 0,
  name: "土木課",
  name_en: "doboku"
)
@sys_groups_33 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_30.id,
  level_no: 3,
  code: "6003",
  sort_no: 30,
  ldap: 0,
  name: "建築住宅課",
  name_en: "kenchikujyutaku"
)
@sys_groups_34 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_30.id,
  level_no: 3,
  code: "6004",
  sort_no: 40,
  ldap: 0,
  name: "道路交通課",
  name_en: "dorokotsu"
)
@sys_groups_35 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_30.id,
  level_no: 3,
  code: "6005",
  sort_no: 50,
  ldap: 0,
  name: "都市計画課",
  name_en: "toshikeikaku"
)
@sys_groups_37 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_36.id,
  level_no: 3,
  code: "7001",
  sort_no: 10,
  ldap: 0,
  name: "商工課",
  name_en: "shoko"
)
@sys_groups_38 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_36.id,
  level_no: 3,
  code: "7002",
  sort_no: 20,
  ldap: 0,
  name: "農林水産課",
  name_en: "norinsuisan"
)
@sys_groups_39 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_36.id,
  level_no: 3,
  code: "7003",
  sort_no: 30,
  ldap: 0,
  name: "観光振興課",
  name_en: "kankoshinko"
)
@sys_groups_41 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_40.id,
  level_no: 3,
  code: "8001",
  sort_no: 10,
  ldap: 0,
  name: "消防本部総務課",
  name_en: "shobo-somu"
)
@sys_groups_42 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_40.id,
  level_no: 3,
  code: "8002",
  sort_no: 20,
  ldap: 0,
  name: "予防課",
  name_en: "yobo"
)
@sys_groups_43 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_40.id,
  level_no: 3,
  code: "8003",
  sort_no: 30,
  ldap: 0,
  name: "消防署",
  name_en: "shobosho"
)
@sys_groups_47 ||= Sys::Group.create!(
  state: "enabled",
  parent_id: @sys_groups_9.id,
  level_no: 3,
  code: "2006",
  sort_no: 60,
  ldap: 0,
  name: "国際交流課",
  name_en: "kokusaikoryu",
  tel: "",
  email: "",
  fax: "",
  address: "",
  note: "",
  tel_attend: ""
)
