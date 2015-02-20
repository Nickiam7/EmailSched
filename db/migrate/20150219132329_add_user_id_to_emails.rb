class AddUserIdToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :user_id, :integer
    add_index :emails, :user_id
  end
end
