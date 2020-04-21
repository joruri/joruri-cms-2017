@gp_article_related_docs_0 = GpArticle::RelatedDoc.new(id: 0)
@gp_article_related_docs_41 ||= GpArticle::RelatedDoc.create!(
  content_id: @cms_contents_1.id,
  relatable_id: @gp_article_docs_575.id,
  relatable_type: "GpArticle::Doc",
  name: "2017080200044"
)
@gp_article_related_docs_42 ||= GpArticle::RelatedDoc.create!(
  content_id: @cms_contents_1.id,
  relatable_id: @gp_article_docs_576.id,
  relatable_type: "GpArticle::Doc",
  name: "2017080200037"
)
