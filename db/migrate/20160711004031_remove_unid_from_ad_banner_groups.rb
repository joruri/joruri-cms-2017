class RemoveUnidFromAdBannerGroups < ActiveRecord::Migration[4.2]
  def change
    remove_column :ad_banner_groups, :unid, :integer
  end
end
