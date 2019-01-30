class UpdatePreparedStateOnGpArticleDocs < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
      update gp_article_docs set state = 'prepared' from sys_tasks
        where sys_tasks.processable_type = 'GpArticle::Doc' and sys_tasks.processable_id = gp_article_docs.id and gp_article_docs.state = 'approved'
    SQL
  end
end
