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

ActiveRecord::Schema.define(version: 20180209201658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_dictionaries", force: :cascade do |t|
    t.bigint "dictionary_id"
    t.bigint "user_id"
    t.date "date"
    t.integer "wrong", limit: 2, default: 0, null: false
    t.integer "successful", limit: 2, default: 0, null: false
    t.index ["dictionary_id"], name: "index_day_dictionaries_on_dictionary_id"
    t.index ["user_id"], name: "index_day_dictionaries_on_user_id"
  end

  create_table "dictionaries", force: :cascade do |t|
    t.integer "language", default: 0, null: false
    t.integer "vocabulary", default: 0, null: false
    t.integer "category", default: 0, null: false
    t.string "word"
    t.string "translate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_families_on_child_id"
    t.index ["parent_id"], name: "index_families_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone", default: "", null: false
    t.bigint "telegram_id"
    t.string "username", default: ""
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.date "birthday"
    t.integer "role", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "gender"
    t.integer "study", limit: 2, default: 4
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["telegram_id"], name: "index_users_on_telegram_id", unique: true
  end

end
