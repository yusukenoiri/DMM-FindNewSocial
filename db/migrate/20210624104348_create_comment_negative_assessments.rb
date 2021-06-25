class CreateCommentNegativeAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_negative_assessments do |t|
      t.integer :comment
      t.timestamps
    end
  end
end
