class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.datetime :starts_at
      t.integer :qty
      t.string :pre

      t.timestamps null: false
    end
  end
end
