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

ActiveRecord::Schema.define(version: 20170810220759) do

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "library_id", "title"], name: "index_documents_on_user_id_and_library_id_and_title", unique: true
  end

  create_table "libraries", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "user_id"
    t.index ["user_id", "name"], name: "index_libraries_on_user_id_and_name", unique: true
  end

  create_table "sources", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.string   "language_code"
    t.string   "content_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["url"], name: "index_sources_on_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "websites", force: :cascade do |t|
    t.string   "title"
    t.string   "note"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "source_id"
    t.index ["user_id", "library_id", "url"], name: "index_websites_on_user_id_and_library_id_and_url", unique: true
  end

end
