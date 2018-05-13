class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.text :title, null: false
      t.text :short_description
      t.interval :complete_time, null: false
      t.integer :complete_percentage, null: false

      t.timestamps
    end

    add_index(:topics, :title, unique: true)
  end
end
