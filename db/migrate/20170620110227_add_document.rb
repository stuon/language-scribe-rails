class AddDocument < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :library_id
      t.timestamps
    end  

    add_index :documents, [:user_id, :library_id, :title], unique: true
  end
end
