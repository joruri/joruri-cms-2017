@gp_category_categories_0 = GpCategory::Category.new(id: 0)
@gp_category_categories_1 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_2.id,
  state: "public",
  name: "chumoku",
  title: "注目情報",
  level_no: 1,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_5.id,
  children_count: 0
)
@gp_category_categories_3 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_2.id,
  state: "public",
  name: "emergency",
  title: "緊急情報",
  level_no: 1,
  sort_no: 100,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_5.id,
  children_count: 0
)
@gp_category_categories_4 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_4.id,
  state: "public",
  name: "event",
  title: "イベント",
  level_no: 1,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_6.id,
  children_count: 0
)
@gp_category_categories_5 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_4.id,
  state: "public",
  name: "sports",
  title: "スポーツ",
  level_no: 1,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_6.id,
  children_count: 0
)
@gp_category_categories_6 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_4.id,
  state: "public",
  name: "koza",
  title: "講座",
  level_no: 1,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_6.id,
  children_count: 0
)
@gp_category_categories_7 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_4.id,
  state: "public",
  name: "matsuri",
  title: "お祭り",
  level_no: 1,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_6.id,
  children_count: 0
)
@gp_category_categories_8 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_4.id,
  state: "public",
  name: "teireikai",
  title: "定例会",
  level_no: 1,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_6.id,
  children_count: 0
)
@gp_category_categories_9 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_2.id,
  state: "public",
  name: "opendata",
  title: "オープンデータ",
  level_no: 1,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_5.id,
  children_count: 0
)
@gp_category_categories_10 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_2.id,
  state: "public",
  name: "download",
  title: "ダウンロード",
  level_no: 1,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_5.id,
  children_count: 0
)
@gp_category_categories_11 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_2.id,
  state: "public",
  name: "tetsuzuki",
  title: "手続き",
  level_no: 1,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_5.id,
  children_count: 0
)
@gp_category_categories_12 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_2.id,
  state: "public",
  name: "boshu",
  title: "募集",
  level_no: 1,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_5.id,
  children_count: 0
)
@gp_category_categories_13 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "ninshin",
  title: "妊娠・出産",
  level_no: 1,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_14 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "kosodate",
  title: "子育て・教育",
  level_no: 1,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_15 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "seijin",
  title: "成人・就職",
  level_no: 1,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_16 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "kekkon",
  title: "結婚・離婚",
  level_no: 1,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_17 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "hikkoshi",
  title: "引越し・住まい",
  level_no: 1,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_18 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "byoki",
  title: "病気・けが",
  level_no: 1,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_19 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "shogaisha",
  title: "障がい者",
  level_no: 1,
  sort_no: 70,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_20 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "shitsugyo",
  title: "失業・退職",
  level_no: 1,
  sort_no: 80,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_21 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "korei",
  title: "高齢・介護",
  level_no: 1,
  sort_no: 90,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_22 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_3.id,
  state: "public",
  name: "shibo",
  title: "死亡・相続",
  level_no: 1,
  sort_no: 100,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_4.id,
  children_count: 0
)
@gp_category_categories_23 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "todokede",
  title: "届出・登録・証明",
  level_no: 1,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 9
)
@gp_category_categories_24 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "hoken",
  title: "保険・年金・介護",
  level_no: 1,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 4
)
@gp_category_categories_25 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "hukushi",
  title: "福祉",
  level_no: 1,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 6
)
@gp_category_categories_26 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "kenko",
  title: "健康・予防",
  level_no: 1,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 6
)
@gp_category_categories_27 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "zei",
  title: "税金",
  level_no: 1,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 9
)
@gp_category_categories_28 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "ikuji",
  title: "育児・教育",
  level_no: 1,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 9
)
@gp_category_categories_29 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "seikatsu",
  title: "生活・インフラ",
  level_no: 1,
  sort_no: 70,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 5
)
@gp_category_categories_30 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "anshin",
  title: "安心・安全",
  level_no: 1,
  sort_no: 80,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 5
)
@gp_category_categories_31 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "kankyo",
  title: "環境・ごみ",
  level_no: 1,
  sort_no: 90,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 3
)
@gp_category_categories_32 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "nyusatsu",
  title: "入札・契約",
  level_no: 1,
  sort_no: 100,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 5
)
@gp_category_categories_33 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "toshiseibi",
  title: "都市整備",
  level_no: 1,
  sort_no: 110,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 2
)
@gp_category_categories_34 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "chiikisangyo",
  title: "地域産業",
  level_no: 1,
  sort_no: 120,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 4
)
@gp_category_categories_35 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "shisei",
  title: "市政情報",
  level_no: 1,
  sort_no: 130,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 4
)
@gp_category_categories_36 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "kanko",
  title: "観光・物産",
  level_no: 1,
  sort_no: 140,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 3
)
@gp_category_categories_37 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "shisetsu",
  title: "施設案内",
  level_no: 1,
  sort_no: 150,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 12
)
@gp_category_categories_39 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "gikai_senkyo",
  title: "議会・選挙",
  level_no: 1,
  sort_no: 160,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 2
)
@gp_category_categories_40 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "kohokocho",
  title: "広報・広聴",
  level_no: 1,
  sort_no: 170,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 3
)
@gp_category_categories_41 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "johokokai",
  title: "情報公開",
  level_no: 1,
  sort_no: 180,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 6
)
@gp_category_categories_42 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "koryu",
  title: "交流事業",
  level_no: 1,
  sort_no: 190,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 3
)
@gp_category_categories_43 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  state: "public",
  name: "nayami",
  title: "悩み・相談",
  level_no: 1,
  sort_no: 200,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_3.id,
  children_count: 0
)
@gp_category_categories_44 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "juminhyo",
  title: "住民票",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_45 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "inkan",
  title: "印鑑登録",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_46 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "koseki",
  title: "戸籍",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_47 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "gaikokujin",
  title: "外国人登録",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_48 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "shomei",
  title: "各種証明書",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_49 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "jukinet",
  title: "住基ネット・公的個人認証",
  level_no: 2,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_50 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "passport",
  title: "パスポート",
  level_no: 2,
  sort_no: 70,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_51 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "my-number",
  title: "マイナンバー制度",
  level_no: 2,
  sort_no: 80,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_52 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_23.id,
  state: "public",
  name: "procedure",
  title: "手続き・本人確認・委任",
  level_no: 2,
  sort_no: 90,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_53 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_24.id,
  state: "public",
  name: "kokuho",
  title: "国民健康保険",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_54 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_24.id,
  state: "public",
  name: "nenkin",
  title: "国民年金",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_55 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_24.id,
  state: "public",
  name: "kaigo",
  title: "介護保険",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_56 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_24.id,
  state: "public",
  name: "kouki",
  title: "後期高齢者医療",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_57 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_25.id,
  state: "public",
  name: "fuyo",
  title: "児童扶養手当",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_58 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_25.id,
  state: "public",
  name: "hitori",
  title: "ひとり親家庭助成",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_59 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_25.id,
  state: "public",
  name: "tokubetsu",
  title: "特別児童扶養手当",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_60 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_25.id,
  state: "public",
  name: "shogai",
  title: "障がい者助成",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_61 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_25.id,
  state: "public",
  name: "korei",
  title: "高齢者福祉",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_62 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_25.id,
  state: "public",
  name: "seikatsuhogo",
  title: "生活保護",
  level_no: 2,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_63 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_26.id,
  state: "public",
  name: "boshihoken",
  title: "母子保健",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_64 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_26.id,
  state: "public",
  name: "yobo",
  title: "予防接種",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_65 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_26.id,
  state: "public",
  name: "tokuteikenshin",
  title: "総合健(検)診･保健指導",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_66 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_26.id,
  state: "public",
  name: "kenko",
  title: "健康づくり",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_67 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_26.id,
  state: "public",
  name: "infection",
  title: "感染症",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_68 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_26.id,
  state: "public",
  name: "sonota",
  title: "その他",
  level_no: 2,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_69 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "shikenmin",
  title: "市県民税",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_70 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "shizei_gaiyo",
  title: "市税概要",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_71 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "koteishisan",
  title: "固定資産税",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_72 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "keijidosha",
  title: "軽自動車税",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_73 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "sonota",
  title: "その他の税",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_74 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "nofu",
  title: "納付・収納",
  level_no: 2,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_75 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "shomeisho",
  title: "税務関連証明書",
  level_no: 2,
  sort_no: 70,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_76 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "kobai",
  title: "公売情報",
  level_no: 2,
  sort_no: 80,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_77 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_27.id,
  state: "public",
  name: "furusato",
  title: "ふるさと納税",
  level_no: 2,
  sort_no: 90,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_78 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "hoikusho",
  title: "保育所",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_79 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "yochien",
  title: "幼稚園",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_80 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "ikujishien",
  title: "育児支援",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_81 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "gakudohoiku",
  title: "学童保育",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_82 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "gakko",
  title: "学校教育",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_83 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "kyushoku",
  title: "給食",
  level_no: 2,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_84 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "shogaigakushu",
  title: "生涯学習",
  level_no: 2,
  sort_no: 70,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_85 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "shugakutaiyo",
  title: "就学資金貸与",
  level_no: 2,
  sort_no: 80,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_86 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_28.id,
  state: "public",
  name: "education",
  title: "教育委員会",
  level_no: 2,
  sort_no: 90,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_87 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_29.id,
  state: "public",
  name: "koeijutaku",
  title: "公営住宅",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_88 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_29.id,
  state: "public",
  name: "suido",
  title: "上水道",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_89 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_29.id,
  state: "public",
  name: "gesuido",
  title: "下水道",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_90 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_29.id,
  state: "public",
  name: "doro",
  title: "道路",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_91 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_29.id,
  state: "public",
  name: "kokyo",
  title: "公共交通（電車・バスなど）",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_92 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_30.id,
  state: "public",
  name: "kyukyu",
  title: "救急・消防",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_93 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_30.id,
  state: "public",
  name: "kyujitsushinryo",
  title: "休日診療案内",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_94 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_30.id,
  state: "public",
  name: "bosaigai",
  title: "防災・災害",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_95 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_30.id,
  state: "public",
  name: "bohan",
  title: "防犯・交通安全",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_96 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_30.id,
  state: "public",
  name: "jiko",
  title: "事故・被災支援",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_97 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_31.id,
  state: "public",
  name: "gomi",
  title: "ごみ・リサイクル",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_98 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_31.id,
  state: "public",
  name: "pet",
  title: "ペット・動物愛護",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_99 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_31.id,
  state: "public",
  name: "eco",
  title: "エコ・環境・公害",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_100 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_32.id,
  state: "public",
  name: "joho",
  title: "入札情報",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_101 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_32.id,
  state: "public",
  name: "kobo",
  title: "公募",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_102 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_32.id,
  state: "public",
  name: "shikakushinsei",
  title: "入札参加資格申請",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_103 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_32.id,
  state: "public",
  name: "shokibokoji",
  title: "小規模工事等業者登録",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_104 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_32.id,
  state: "public",
  name: "henko",
  title: "入札参加資格申請変更届け",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_105 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_33.id,
  state: "public",
  name: "keikaku",
  title: "都市計画・まちづくり",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_106 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_33.id,
  state: "public",
  name: "doro",
  title: "道路整備",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_107 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_34.id,
  state: "public",
  name: "kigyoyushi",
  title: "企業融資・支援",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_108 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_34.id,
  state: "public",
  name: "noringyo",
  title: "農業・林業",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_109 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_34.id,
  state: "public",
  name: "shokogyo",
  title: "商業・工業",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_110 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_34.id,
  state: "public",
  name: "koyo",
  title: "雇用",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_111 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_35.id,
  state: "public",
  name: "shokai",
  title: "市紹介",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_112 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_35.id,
  state: "public",
  name: "kyodosankaku",
  title: "男女共同参画",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_114 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_35.id,
  state: "public",
  name: "saiyo",
  title: "職員採用",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_115 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_36.id,
  state: "public",
  name: "rekishi",
  title: "歴史・文化財",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_116 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_36.id,
  state: "public",
  name: "kanko",
  title: "観光",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_117 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_36.id,
  state: "public",
  name: "bussan",
  title: "物産",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_118 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_35.id,
  state: "public",
  name: "site",
  title: "市ホームページ",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_119 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "shiyakusho",
  title: "市役所",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_120 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "hukushi",
  title: "福祉・保健施設",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_121 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "bunka_sports",
  title: "文化・スポーツ施設",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_122 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "hoikusho",
  title: "保育所",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_123 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "yochien",
  title: "幼稚園",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_124 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "shochugakko",
  title: "小学校・中学校",
  level_no: 2,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_125 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "kominkan",
  title: "公民館",
  level_no: 2,
  sort_no: 70,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_126 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "center",
  title: "男女共同参画推進センター",
  level_no: 2,
  sort_no: 80,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_127 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "koen",
  title: "公園",
  level_no: 2,
  sort_no: 90,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_128 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "shieijyutaku",
  title: "市営住宅",
  level_no: 2,
  sort_no: 100,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_129 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "museum",
  title: "美術館",
  level_no: 2,
  sort_no: 110,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_130 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_37.id,
  state: "public",
  name: "bochi",
  title: "斎場・墓地",
  level_no: 2,
  sort_no: 120,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_131 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_39.id,
  state: "public",
  name: "gikai",
  title: "議会",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_132 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_39.id,
  state: "public",
  name: "senkyo",
  title: "選挙",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_133 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_40.id,
  state: "public",
  name: "koho",
  title: "広報",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_134 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_40.id,
  state: "public",
  name: "kocho",
  title: "広聴",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_135 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_40.id,
  state: "public",
  name: "gyoseisodan",
  title: "行政相談窓口",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_136 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_41.id,
  state: "public",
  name: "johokokai_kojinjoho",
  title: "情報公開・個人情報制度",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_137 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_41.id,
  state: "public",
  name: "keikaku",
  title: "計画・取り組み",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_138 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_41.id,
  state: "public",
  name: "zaisei",
  title: "財政状況",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_139 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_41.id,
  state: "public",
  name: "tokei",
  title: "統計",
  level_no: 2,
  sort_no: 40,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_140 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_41.id,
  state: "public",
  name: "jorei_reiki",
  title: "条例・例規集	",
  level_no: 2,
  sort_no: 50,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_141 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_41.id,
  state: "public",
  name: "kyuyoteisu",
  title: "職員給与・定員管理",
  level_no: 2,
  sort_no: 60,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_142 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_42.id,
  state: "public",
  name: "kokusai",
  title: "国際交流",
  level_no: 2,
  sort_no: 10,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_143 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_42.id,
  state: "public",
  name: "heiwakoryu",
  title: "平和交流",
  level_no: 2,
  sort_no: 20,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
@gp_category_categories_144 ||= GpCategory::Category.create!(
  category_type_id: @gp_category_category_types_1.id,
  parent_id: @gp_category_categories_42.id,
  state: "public",
  name: "yukotoshikoryu",
  title: "友好都市交流",
  level_no: 2,
  sort_no: 30,
  description: "",
  sitemap_state: "visible",
  docs_order: "",
  template_id: @gp_category_templates_7.id,
  children_count: 0
)
