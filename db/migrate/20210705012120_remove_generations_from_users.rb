class RemoveGenerationsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :generations, :integer
  end
end
