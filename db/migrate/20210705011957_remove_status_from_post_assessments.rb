class RemoveStatusFromPostAssessments < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_assessments, :status, :integer
  end
end
