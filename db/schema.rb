# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_20_202312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "BRL", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["user_id", "title"], name: "index_accounts_on_user_id_and_title", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["user_id", "title"], name: "index_categories_on_user_id_and_title", unique: true
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "category_id", null: false
    t.integer "group", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "BRL", null: false
    t.date "occurred_on", null: false
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payee", default: ""
    t.index ["account_id"], name: "index_records_on_account_id"
    t.index ["category_id"], name: "index_records_on_category_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "records", "accounts"
  add_foreign_key "records", "categories"
end
