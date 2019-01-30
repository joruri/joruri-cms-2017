class CreateToolConvertDocs < ActiveRecord::Migration[4.2]
 def change 
   create_table :tool_convert_docs do |t| 
     t.string :name 
     t.string :doc_class 
     t.string :file_path 
     t.string :uri_path 
     t.string :host 
     t.text :title 
     t.datetime :published_at 
     t.text :body
     t.timestamps
   end
  end 
end
