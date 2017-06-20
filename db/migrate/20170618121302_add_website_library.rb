class AddWebsiteLibrary < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :title
      t.string :note
      t.string :url
      t.integer :user_id
      t.integer :library_id
      t.timestamps
    end  

    add_index :websites, [:user_id, :library_id, :url], unique: true
  end
end
