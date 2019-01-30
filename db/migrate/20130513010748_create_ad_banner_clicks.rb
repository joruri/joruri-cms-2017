class CreateAdBannerClicks < ActiveRecord::Migration[4.2]
  def change
    create_table :ad_banner_clicks do |t|
      t.references :banner

      t.string :referer
      t.string :remote_addr
      t.string :user_agent

      t.timestamps
    end
  end
end
