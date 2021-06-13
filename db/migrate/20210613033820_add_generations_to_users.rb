class AddGenerationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :generations, :integer
    add_column :users, :sex, :integer
  end
end
