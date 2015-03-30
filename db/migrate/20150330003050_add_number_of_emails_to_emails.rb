class AddNumberOfEmailsToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :number_of_emails, :integer
  end
end
