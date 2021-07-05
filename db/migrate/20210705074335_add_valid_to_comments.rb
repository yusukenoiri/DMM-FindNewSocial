class AddValidToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :is_valid, :boolean
  end
end
