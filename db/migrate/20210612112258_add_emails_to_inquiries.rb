class AddEmailsToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :email, :string
    add_column :inquiries, :phone_number, :string
    add_column :inquiries, :subject, :integer, default: 0
  end
end
