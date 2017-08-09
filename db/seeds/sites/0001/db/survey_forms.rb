@survey_forms_0 = Survey::Form.new(id: 0)
@survey_forms_1 ||= Survey::Form.create!(
  content_id: @cms_contents_6.id,
  state: "public",
  name: "toiawase",
  title: "市へのお問い合わせ",
  sort_no: 10,
  summary: "",
  description: "",
  receipt: <<EOS.chomp,
<p>お問い合わせを受け付けました。<br />\r
自動返信メールが届いているかご確認ください。（送信までにお時間がかかる場合があります）</p>\r

EOS
  confirmation: true,
  sitemap_state: "visible",
  index_link: "visible"
)
@survey_forms_2 ||= Survey::Form.create!(
  content_id: @cms_contents_6.id,
  state: "public",
  name: "goiken",
  title: "市へのご意見・ご提案",
  sort_no: 20,
  summary: "",
  description: <<EOS.chomp,
<p>市政に対する建設的なご意見、ご要望をお待ちしております。<br />\r
今後の市政運営の参考にさせていただきますので、ご記入いただく内容は、できるだけ具体的にお願いします。<br />\r
第三者への誹謗・中傷となる内容並びに特定の個人及び団体に関する情報等で公序良俗に反する内容は送信しないでください。</p>\r

EOS
  receipt: <<EOS.chomp,
<p>ご意見・ご提案を受け付けました。<br />\r
自動返信メールが届いているかご確認ください。（送信までにお時間がかかる場合があります）</p>\r

EOS
  confirmation: true,
  sitemap_state: "visible",
  index_link: "visible"
)
