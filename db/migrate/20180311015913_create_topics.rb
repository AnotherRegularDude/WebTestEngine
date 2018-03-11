class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.text :title, null: false
      t.text :short_description, null: false
      t.integer :number_of_questions, null: false

      t.timestamps
    end

    add_index(:topics, :title, unique: true)
  end
end
