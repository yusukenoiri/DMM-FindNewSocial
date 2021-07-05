class RemoveStatusFromCommentAssessments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comment_assessments, :status, :integer
  end
end
