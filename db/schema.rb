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

ActiveRecord::Schema[7.0].define(version: 2022_12_02_144225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "slug", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "code", limit: 3, null: false
    t.string "symbol", limit: 20, null: false
    t.string "symbol_native", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "documents_expense_operations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id", null: false
    t.bigint "person_wallet_id", null: false
    t.bigint "currency_id", null: false
    t.bigint "category_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "amount", precision: 10, scale: 4, default: "0.0", null: false
    t.decimal "currency_rate", precision: 10, scale: 10, default: "0.0", null: false
    t.datetime "transaction_time", null: false
    t.string "comment", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_documents_expense_operations_on_category_id"
    t.index ["currency_id"], name: "index_documents_expense_operations_on_currency_id"
    t.index ["person_id"], name: "index_documents_expense_operations_on_person_id"
    t.index ["person_wallet_id"], name: "index_documents_expense_operations_on_person_wallet_id"
  end

  create_table "documents_income_operations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id", null: false
    t.bigint "person_wallet_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "amount", precision: 10, scale: 4, default: "0.0", null: false
    t.datetime "transaction_time", null: false
    t.string "comment", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_documents_income_operations_on_person_id"
    t.index ["person_wallet_id"], name: "index_documents_income_operations_on_person_wallet_id"
  end

  create_table "documents_money_transfers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id", null: false
    t.bigint "person_wallet_from_id", null: false
    t.bigint "person_wallet_to_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "amount_from", precision: 10, scale: 4, default: "0.0", null: false
    t.decimal "amount_to", precision: 10, scale: 4, default: "0.0", null: false
    t.decimal "currency_rate", precision: 10, scale: 10, default: "1.0", null: false
    t.datetime "transaction_time", null: false
    t.string "comment", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_documents_money_transfers_on_person_id"
    t.index ["person_wallet_from_id"], name: "index_documents_money_transfers_on_person_wallet_from_id"
    t.index ["person_wallet_to_id"], name: "index_documents_money_transfers_on_person_wallet_to_id"
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", limit: 100, null: false
    t.string "last_name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_configs", force: :cascade do |t|
    t.uuid "person_id", null: false
    t.bigint "default_currency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_currency_id"], name: "index_person_configs_on_default_currency_id"
    t.index ["person_id"], name: "index_person_configs_on_person_id"
  end

  create_table "person_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "person_wallet_id", null: false
    t.string "initiator_document_type", null: false
    t.uuid "initiator_document_id", null: false
    t.bigint "currency_id", null: false
    t.decimal "income", precision: 10, scale: 4, default: "0.0", null: false
    t.decimal "expense", precision: 10, scale: 4, default: "0.0", null: false
    t.datetime "posted_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_person_transactions_on_currency_id"
    t.index ["initiator_document_type", "initiator_document_id"], name: "index_person_transactions_on_initiator_document"
    t.index ["person_wallet_id"], name: "index_person_transactions_on_person_wallet_id"
  end

  create_table "person_wallet_groups", force: :cascade do |t|
    t.uuid "person_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_wallet_groups_on_person_id"
  end

  create_table "person_wallets", force: :cascade do |t|
    t.uuid "person_id", null: false
    t.bigint "currency_id", null: false
    t.integer "wallet_type", limit: 2, null: false
    t.string "name", limit: 255, null: false
    t.decimal "amount", precision: 10, scale: 4, default: "0.0", null: false
    t.boolean "no_balance_control", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["currency_id"], name: "index_person_wallets_on_currency_id"
    t.index ["group_id"], name: "index_person_wallets_on_group_id"
    t.index ["person_id"], name: "index_person_wallets_on_person_id"
  end

  create_table "transaction_categories", force: :cascade do |t|
    t.uuid "person_transaction_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_transaction_categories_on_category_id"
    t.index ["person_transaction_id", "category_id"], name: "idx_unique_on_person_transaction_id_and_category_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
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
    t.uuid "person_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["person_id"], name: "index_users_on_person_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "documents_expense_operations", "categories", on_delete: :restrict
  add_foreign_key "documents_expense_operations", "currencies", on_delete: :restrict
  add_foreign_key "documents_expense_operations", "people"
  add_foreign_key "documents_expense_operations", "person_wallets", on_delete: :restrict
  add_foreign_key "documents_income_operations", "people"
  add_foreign_key "documents_income_operations", "person_wallets", on_delete: :restrict
  add_foreign_key "documents_money_transfers", "people"
  add_foreign_key "documents_money_transfers", "person_wallets", column: "person_wallet_from_id", on_delete: :restrict
  add_foreign_key "documents_money_transfers", "person_wallets", column: "person_wallet_to_id", on_delete: :restrict
  add_foreign_key "person_configs", "currencies", column: "default_currency_id", on_delete: :restrict
  add_foreign_key "person_configs", "people"
  add_foreign_key "person_transactions", "currencies", on_delete: :restrict
  add_foreign_key "person_transactions", "person_wallets", on_delete: :restrict
  add_foreign_key "person_wallet_groups", "people"
  add_foreign_key "person_wallets", "currencies"
  add_foreign_key "person_wallets", "people"
  add_foreign_key "person_wallets", "person_wallet_groups", column: "group_id"
  add_foreign_key "transaction_categories", "categories"
  add_foreign_key "transaction_categories", "person_transactions"
  add_foreign_key "users", "people"
end
