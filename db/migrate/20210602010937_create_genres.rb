class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :title
      t.string :name
      t.boolean :is_available, default: true
      t.timestamps
    end
  end
end
