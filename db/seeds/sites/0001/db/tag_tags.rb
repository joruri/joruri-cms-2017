@tag_tags_0 = Tag::Tag.new(id: 0)
@tag_tags_4 ||= Tag::Tag.create!(
  content_id: @cms_contents_3.id,
  word: "中央公民館",
  last_tagged_at: Time.now
)
@tag_tags_5 ||= Tag::Tag.create!(
  content_id: @cms_contents_3.id,
  word: "料理教室",
  last_tagged_at: Time.now
)
@tag_tags_6 ||= Tag::Tag.create!(
  content_id: @cms_contents_3.id,
  word: "イベント",
  last_tagged_at: Time.now
)
@tag_tags_7 ||= Tag::Tag.create!(
  content_id: @cms_contents_3.id,
  word: "夏休み親子教室",
  last_tagged_at: Time.now
)
