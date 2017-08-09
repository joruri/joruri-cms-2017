@survey_questions_0 = Survey::Question.new(id: 0)
@survey_questions_1 ||= Survey::Question.create!(
  form_id: @survey_forms_2.id,
  state: "public",
  title: "ご意見等の件名",
  description: "",
  form_type: "text_field",
  form_options: "",
  required: true,
  style_attribute: "",
  sort_no: 10
)
@survey_questions_5 ||= Survey::Question.create!(
  form_id: @survey_forms_1.id,
  state: "public",
  title: "お名前",
  description: "",
  form_type: "text_field",
  form_options: "",
  required: true,
  style_attribute: "",
  sort_no: 10
)
@survey_questions_4 ||= Survey::Question.create!(
  form_id: @survey_forms_2.id,
  state: "public",
  title: "ご意見・ご提案内容",
  description: "",
  form_type: "text_area",
  form_options: "",
  required: true,
  style_attribute: "",
  sort_no: 20
)
@survey_questions_10 ||= Survey::Question.create!(
  form_id: @survey_forms_1.id,
  state: "public",
  title: "電話番号",
  description: "",
  form_type: "text_field",
  form_options: "",
  required: false,
  style_attribute: "",
  sort_no: 20
)
@survey_questions_8 ||= Survey::Question.create!(
  form_id: @survey_forms_2.id,
  state: "public",
  title: "ご連絡先（回答希望の場合はご記入ください。）",
  description: "",
  form_type: "free",
  form_options: "",
  required: false,
  style_attribute: "",
  sort_no: 30
)
@survey_questions_9 ||= Survey::Question.create!(
  form_id: @survey_forms_1.id,
  state: "public",
  title: "メールアドレス",
  description: "",
  form_type: "text_field_email",
  form_options: "",
  required: true,
  style_attribute: "",
  sort_no: 30
)
@survey_questions_6 ||= Survey::Question.create!(
  form_id: @survey_forms_2.id,
  state: "public",
  title: "お名前",
  description: "",
  form_type: "text_field",
  form_options: "",
  required: false,
  style_attribute: "",
  sort_no: 40
)
@survey_questions_11 ||= Survey::Question.create!(
  form_id: @survey_forms_1.id,
  state: "public",
  title: "お問い合わせ内容",
  description: "",
  form_type: "text_area",
  form_options: "",
  required: true,
  style_attribute: "",
  sort_no: 40
)
@survey_questions_7 ||= Survey::Question.create!(
  form_id: @survey_forms_2.id,
  state: "public",
  title: "電話番号",
  description: "",
  form_type: "text_field",
  form_options: "",
  required: false,
  style_attribute: "ime-mode:disabled;",
  sort_no: 50
)
@survey_questions_3 ||= Survey::Question.create!(
  form_id: @survey_forms_2.id,
  state: "public",
  title: "メールアドレス",
  description: "",
  form_type: "text_field_email",
  form_options: "",
  required: false,
  style_attribute: "ime-mode:disabled;",
  sort_no: 60
)
@survey_questions_2 ||= Survey::Question.create!(
  form_id: @survey_forms_2.id,
  state: "public",
  title: "住所等",
  description: "",
  form_type: "text_field",
  form_options: "",
  required: false,
  style_attribute: "",
  sort_no: 70
)
