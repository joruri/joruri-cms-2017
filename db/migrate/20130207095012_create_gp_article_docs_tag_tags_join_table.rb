class CreateGpArticleDocsTagTagsJoinTable < ActiveRecord::Migration[4.2]
  def change
    create_table :gp_article_docs_tag_tags, :id => false do |t|
      t.integer :doc_id
      t.integer :tag_id
    end
  end
end
