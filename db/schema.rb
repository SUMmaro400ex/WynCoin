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

ActiveRecord::Schema.define(version: 20160123212157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "api_token"
  end

  create_table "epochs", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "token"
    t.integer  "account_id"
    t.integer  "user_id"
    t.string   "status",     default: "open"
  end

  add_index "epochs", ["account_id"], name: "index_epochs_on_account_id", using: :btree
  add_index "epochs", ["user_id"], name: "index_epochs_on_user_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "amount"
    t.integer  "user_id"
  end

  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "epoch_id"
    t.decimal  "amount"
  end

  add_index "transactions", ["epoch_id"], name: "index_transactions_on_epoch_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "facebook_id"
  end

  add_foreign_key "epochs", "accounts"
  add_foreign_key "epochs", "users"
  add_foreign_key "purchases", "users"
  add_foreign_key "transactions", "epochs"
end
