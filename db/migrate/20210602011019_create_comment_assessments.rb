class CreateCommentAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_assessments do |t|
      t.integer :status
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
