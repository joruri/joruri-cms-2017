class AddKeepFilenameToToolConvertImports < ActiveRecord::Migration[4.2]
  def change
    add_column :tool_convert_imports, :keep_filename, :integer, :after => :overwrite
  end
end
