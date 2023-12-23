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

ActiveRecord::Schema[7.1].define(version: 2023_12_23_024450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "description"
    t.integer "status"
    t.bigint "suggestion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suggestion_id"], name: "index_activities_on_suggestion_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "stock"
    t.integer "amount"
    t.bigint "computer_id"
    t.bigint "custodian_id", null: false
    t.bigint "laboratory_id", null: false
    t.index ["computer_id"], name: "index_assets_on_computer_id"
    t.index ["custodian_id"], name: "index_assets_on_custodian_id"
    t.index ["laboratory_id"], name: "index_assets_on_laboratory_id"
  end

  create_table "computers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custodians", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "degree"
    t.bigint "supervisor_id", null: false
    t.index ["supervisor_id"], name: "index_custodians_on_supervisor_id"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peripherals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "computer_id", null: false
    t.index ["computer_id"], name: "index_peripherals_on_computer_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "asset_id", null: false
    t.index ["asset_id"], name: "index_suggestions_on_asset_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "activities", "suggestions"
  add_foreign_key "assets", "computers"
  add_foreign_key "assets", "custodians"
  add_foreign_key "assets", "laboratories"
  add_foreign_key "custodians", "users", column: "supervisor_id"
  add_foreign_key "peripherals", "computers"
  add_foreign_key "suggestions", "assets"
end
