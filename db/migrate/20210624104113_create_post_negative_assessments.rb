class CreatePostNegativeAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_negative_assessments do |t|
      t.integer :post_id
      t.timestamps
    end
  end
end
