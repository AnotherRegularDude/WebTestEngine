class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :short_description, null: false
      t.text :body_md, null: false
      t.text :body_raw, null: false

      t.belongs_to :topic, index: true
      t.timestamps
    end
  end
end
