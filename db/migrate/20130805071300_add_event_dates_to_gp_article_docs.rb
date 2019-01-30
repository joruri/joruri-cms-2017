class AddEventDatesToGpArticleDocs < ActiveRecord::Migration[4.2]
  def change
    add_column :gp_article_docs, :event_started_on, :date
    add_column :gp_article_docs, :event_ended_on, :date
  end
end
