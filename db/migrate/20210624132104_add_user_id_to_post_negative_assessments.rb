class AddUserIdToPostNegativeAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_negative_assessments, :user_id, :integer
  end
end
