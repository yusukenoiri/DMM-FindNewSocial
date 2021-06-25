class AddUserIdToCommentNegativeAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :comment_negative_assessments, :user_id, :integer
  end
end
