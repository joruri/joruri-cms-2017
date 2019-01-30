class CreateGpCalendarEventsGpCategoryCategoriesJoinTable < ActiveRecord::Migration[4.2]
  def change
    create_table :gp_calendar_events_gp_category_categories, :id => false do |t|
      t.integer :event_id
      t.integer :category_id
    end
  end
end
