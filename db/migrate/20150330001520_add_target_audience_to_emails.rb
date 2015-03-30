class AddTargetAudienceToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :target_audience, :string
  end
end
