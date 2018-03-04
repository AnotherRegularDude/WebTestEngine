class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :username, null: false
      t.text :password_digest, null: false

      t.text :first_name
      t.text :last_name
      t.text :patronymic

      t.integer :role, default: 0, null: false

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
