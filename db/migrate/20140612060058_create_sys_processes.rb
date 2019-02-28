class CreateSysProcesses < ActiveRecord::Migration[4.2]
  def change
    create_table :sys_processes do |t|
      t.timestamps

      t.datetime "started_at"
      t.datetime "closed_at"
      t.integer  "user_id"
      t.string   "state"
      t.string   "name"
      t.string   "interrupt"
      t.integer  "total"
      t.integer  "current"
      t.integer  "success"
      t.integer  "error"
      t.text     "message"
    end
  end
end
