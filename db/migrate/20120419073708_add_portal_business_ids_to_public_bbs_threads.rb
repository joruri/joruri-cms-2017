class AddPortalBusinessIdsToPublicBbsThreads < ActiveRecord::Migration[4.2]
  def change
    add_column :public_bbs_threads, :portal_business_ids, :text
  end
end
