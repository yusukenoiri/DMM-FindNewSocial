class RenameCommentColumnToCommentNegativeAssessments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comment_negative_assessments, :comment, :comment_id
  end
end
