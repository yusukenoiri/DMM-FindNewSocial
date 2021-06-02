class CreatePostAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_assessments do |t|
      t.integer :status
      t.integer :user_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
