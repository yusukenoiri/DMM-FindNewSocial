class AddValidToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :is_valid, :boolean
  end
end
