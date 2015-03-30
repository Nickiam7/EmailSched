class AddCampaignToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :campaign, :boolean, default: false
  end
end
