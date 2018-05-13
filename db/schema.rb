# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180513141901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "articles", force: :cascade do |t|
    t.text "title", null: false
    t.text "short_description", null: false
    t.text "body_md", null: false
    t.text "body_raw", null: false
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_articles_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.text "title", null: false
    t.text "short_description"
    t.integer "complete_time", null: false
    t.integer "complete_percentage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_topics_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "username", null: false
    t.text "password_digest", null: false
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.text "patronymic"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "email", null: false
    t.boolean "activated", default: false, null: false
    t.text "email_confirmation"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
