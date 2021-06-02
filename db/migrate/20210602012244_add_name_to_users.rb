class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :occupation, :integer
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_available, :boolean, default: false
  end
end
