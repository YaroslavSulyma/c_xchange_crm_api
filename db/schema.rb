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

ActiveRecord::Schema[8.0].define(version: 2025_05_10_194339) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code", null: false
    t.integer "kind", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "platforms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_platforms_on_name", unique: true
  end

  create_table "trades", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "platform_id", null: false
    t.uuid "currency_id", null: false
    t.uuid "fiat_currency_id", null: false
    t.integer "direction", null: false
    t.decimal "amount", precision: 15, scale: 8, null: false
    t.decimal "price", precision: 15, scale: 8, null: false
    t.decimal "total", precision: 20, scale: 4, null: false
    t.decimal "fee", precision: 15, scale: 4, default: "0.0", null: false
    t.date "traded_at", default: -> { "now()" }, null: false
    t.string "notes", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid", null: false
    t.index ["currency_id"], name: "index_trades_on_currency_id"
    t.index ["direction"], name: "index_trades_on_direction"
    t.index ["fiat_currency_id"], name: "index_trades_on_fiat_currency_id"
    t.index ["platform_id"], name: "index_trades_on_platform_id"
    t.index ["traded_at"], name: "index_trades_on_traded_at"
    t.index ["uid"], name: "index_trades_on_uid", unique: true
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "trades", "currencies"
  add_foreign_key "trades", "currencies", column: "fiat_currency_id"
  add_foreign_key "trades", "platforms"
  add_foreign_key "trades", "users"
end
