class AddActivatedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activated, :boolean, null: false, default: false
    add_column :users, :email_confirmation, :text
  end
end
