class AddCategorizedAsToGpCategoryCategorizations < ActiveRecord::Migration[4.2]
  def change
    add_column :gp_category_categorizations, :categorized_as, :string
    GpCategory::Categorization.where(categorizable_type: 'GpArticle::Doc').update_all(categorized_as: 'GpArticle::Doc')
  end
end
