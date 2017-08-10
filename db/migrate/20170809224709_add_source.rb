class AddSource < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :language_code
      t.string :content_type
      t.timestamps
    end  

    add_index :sources, [:url], unique: true
  end
end
