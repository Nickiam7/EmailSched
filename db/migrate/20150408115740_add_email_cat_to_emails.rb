class AddEmailCatToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :email_cat, :string
  end
end
