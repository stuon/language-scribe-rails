class AddIndexToLibrary < ActiveRecord::Migration[5.0]
  def change
    add_index :libraries, [:user_id, :name], unique: true
  end
end
