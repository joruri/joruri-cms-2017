class AddMobileColumnsToGpArticleDocs < ActiveRecord::Migration[4.2]
  def change
    add_column :gp_article_docs, :mobile_title, :string
    add_column :gp_article_docs, :mobile_body, :text
    add_column :gp_article_docs, :mobile_smart, :boolean
    add_column :gp_article_docs, :mobile_feature, :boolean
  end
end
