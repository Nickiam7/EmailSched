class AddNotesToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :notes, :text
  end
end
