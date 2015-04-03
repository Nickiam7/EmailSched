class AddFileLocationToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :file_location, :string
  end
end
