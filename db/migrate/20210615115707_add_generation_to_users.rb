class AddGenerationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :generation, :integer
  end
end
