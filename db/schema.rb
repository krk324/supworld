# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140713144138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "city"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "country_code"
    t.string   "country"
    t.string   "population"
    t.string   "wiki_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "city_id"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["city_id"], name: "index_images_on_city_id", using: :btree

  create_table "memos", force: true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.text     "memo",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memos", ["city_id"], name: "index_memos_on_city_id", using: :btree
  add_index "memos", ["user_id"], name: "index_memos_on_user_id", using: :btree

  create_table "tweets", force: true do |t|
    t.integer  "city_id"
    t.text     "tweet",      default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["city_id"], name: "index_tweets_on_city_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["city_id"], name: "index_visits_on_city_id", using: :btree
  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

end
