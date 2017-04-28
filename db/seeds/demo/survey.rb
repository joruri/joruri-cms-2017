Survey::Form.create!([
  {id: 1, content_id: 6, state: "public", name: "toiawase", title: "市へのお問い合わせ", opened_at: nil, closed_at: nil, sort_no: 10, summary: "", description: "", receipt: "<p>お問い合わせを受け付けました。<br />\r\n自動返信メールが届いているかご確認ください。（送信までにお時間がかかる場合があります）</p>\r\n", confirmation: true, sitemap_state: "visible", index_link: "visible"},
  {id: 2, content_id: 6, state: "public", name: "goiken", title: "市へのご意見・ご提案", opened_at: nil, closed_at: nil, sort_no: 20, summary: "", description: "<p>市政に対する建設的なご意見、ご要望をお待ちしております。<br />\r\n今後の市政運営の参考にさせていただきますので、ご記入いただく内容は、できるだけ具体的にお願いします。<br />\r\n第三者への誹謗・中傷となる内容並びに特定の個人及び団体に関する情報等で公序良俗に反する内容は送信しないでください。</p>\r\n", receipt: "<p>ご意見・ご提案を受け付けました。<br />\r\n自動返信メールが届いているかご確認ください。（送信までにお時間がかかる場合があります）</p>\r\n", confirmation: true, sitemap_state: "visible", index_link: "visible"}
])
Survey::Question.create!([
  {id: 5, form_id: 1, state: "public", title: "お名前", description: "", form_type: "text_field", form_options: "", required: true, style_attribute: "", sort_no: 10, form_text_max_length: nil},
  {id: 1, form_id: 2, state: "public", title: "ご意見等の件名", description: "", form_type: "text_field", form_options: "", required: true, style_attribute: "", sort_no: 10, form_text_max_length: nil},
  {id: 4, form_id: 2, state: "public", title: "ご意見・ご提案内容", description: "", form_type: "text_area", form_options: "", required: true, style_attribute: "", sort_no: 20, form_text_max_length: nil},
  {id: 10, form_id: 1, state: "public", title: "電話番号", description: "", form_type: "text_field", form_options: "", required: false, style_attribute: "", sort_no: 20, form_text_max_length: nil},
  {id: 8, form_id: 2, state: "public", title: "ご連絡先（回答希望の場合はご記入ください。）", description: "", form_type: "free", form_options: "", required: false, style_attribute: "", sort_no: 30, form_text_max_length: nil},
  {id: 9, form_id: 1, state: "public", title: "メールアドレス", description: "", form_type: "text_field_email", form_options: "", required: true, style_attribute: "", sort_no: 30, form_text_max_length: nil},
  {id: 6, form_id: 2, state: "public", title: "お名前", description: "", form_type: "text_field", form_options: "", required: false, style_attribute: "", sort_no: 40, form_text_max_length: nil},
  {id: 11, form_id: 1, state: "public", title: "お問い合わせ内容", description: "", form_type: "text_area", form_options: "", required: true, style_attribute: "", sort_no: 40, form_text_max_length: nil},
  {id: 7, form_id: 2, state: "public", title: "電話番号", description: "", form_type: "text_field", form_options: "", required: false, style_attribute: "ime-mode:disabled;", sort_no: 50, form_text_max_length: nil},
  {id: 3, form_id: 2, state: "public", title: "メールアドレス", description: "", form_type: "text_field_email", form_options: "", required: false, style_attribute: "ime-mode:disabled;", sort_no: 60, form_text_max_length: nil},
  {id: 2, form_id: 2, state: "public", title: "住所等", description: "", form_type: "text_field", form_options: "", required: false, style_attribute: "", sort_no: 70, form_text_max_length: nil}
])
