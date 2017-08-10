class AddSourceToWebsite < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :source_id, :integer
  end
end
