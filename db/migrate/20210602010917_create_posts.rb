class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
