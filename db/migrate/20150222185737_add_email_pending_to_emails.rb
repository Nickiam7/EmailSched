class AddEmailPendingToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :email_pending, :boolean, default: true
  end
end
