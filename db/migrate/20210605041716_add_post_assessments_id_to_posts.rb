class AddPostAssessmentsIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :post_assessments, :post_id, :integer
  end
end
