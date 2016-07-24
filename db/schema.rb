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

ActiveRecord::Schema.define(version: 20160724013707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emotions", force: :cascade do |t|
    t.integer  "entry_id"
    t.float    "anger"
    t.float    "joy"
    t.float    "fear"
    t.float    "sadness"
    t.float    "surprise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["entry_id"], name: "index_emotions_on_entry_id", using: :btree
    t.index ["user_id"], name: "index_emotions_on_user_id", using: :btree
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "journal_id"
    t.boolean  "favorite"
    t.string   "title"
    t.text     "body"
    t.string   "accomplishment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "entry_header"
    t.index ["journal_id"], name: "index_entries_on_journal_id", using: :btree
    t.index ["user_id"], name: "index_entries_on_user_id", using: :btree
  end

  create_table "journals", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_journals_on_user_id", using: :btree
  end

  create_table "sentiments", force: :cascade do |t|
    t.integer  "entry_id"
    t.float    "positivity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["entry_id"], name: "index_sentiments_on_entry_id", using: :btree
    t.index ["user_id"], name: "index_sentiments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "emotions", "entries"
  add_foreign_key "emotions", "users"
  add_foreign_key "entries", "journals"
  add_foreign_key "entries", "users"
  add_foreign_key "journals", "users"
  add_foreign_key "sentiments", "entries"
  add_foreign_key "sentiments", "users"
end
