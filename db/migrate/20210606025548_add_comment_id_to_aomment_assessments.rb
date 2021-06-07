class AddCommentIdToAommentAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :comment_assessments, :comment_id, :integer
  end
end
