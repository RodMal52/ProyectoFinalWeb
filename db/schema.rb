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

ActiveRecord::Schema.define(version: 20150504011932) do

  create_table "accounts", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true

  create_table "accounts_roles", id: false, force: true do |t|
    t.integer "account_id"
    t.integer "role_id"
  end

  add_index "accounts_roles", ["account_id", "role_id"], name: "index_accounts_roles_on_account_id_and_role_id"

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "cellphone"
    t.integer  "account_id"
    t.string   "carreer1"
    t.string   "carreer2"
    t.string   "carreer3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidates", ["account_id"], name: "index_candidates_on_account_id"

  create_table "create_table_candidate_events", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "event_id"
    t.boolean  "assistance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "create_table_candidate_events", ["candidate_id"], name: "index_create_table_candidate_events_on_candidate_id"
  add_index "create_table_candidate_events", ["event_id"], name: "index_create_table_candidate_events_on_event_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "capacity"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

end
