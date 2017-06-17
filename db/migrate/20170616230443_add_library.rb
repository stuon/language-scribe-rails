class AddLibrary < ActiveRecord::Migration[5.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :description
      t.integer :user_id
    end
  end
end
