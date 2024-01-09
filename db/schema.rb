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

ActiveRecord::Schema[7.1].define(version: 2024_01_09_171543) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text "message"
    t.bigint "suggestion_id", null: false
    t.string "actor_type"
    t.bigint "actor_id"
    t.index ["actor_type", "actor_id"], name: "index_activities_on_actor"
    t.index ["suggestion_id"], name: "index_activities_on_suggestion_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "stock"
    t.integer "amount"
    t.bigint "computer_id"
    t.string "custodian_type"
    t.bigint "custodian_id"
    t.bigint "laboratory_id", null: false
    t.index ["computer_id"], name: "index_assets_on_computer_id"
    t.index ["custodian_type", "custodian_id"], name: "index_assets_on_custodian"
    t.index ["laboratory_id"], name: "index_assets_on_laboratory_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "computers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "building_number"
  end

  create_table "peripherals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "computer_id"
    t.bigint "asset_id"
    t.index ["asset_id"], name: "index_peripherals_on_asset_id"
    t.index ["computer_id"], name: "index_peripherals_on_computer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "name", default: 0
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "status", default: 0, null: false
    t.bigint "asset_id", null: false
    t.string "suggestor_type"
    t.bigint "suggestor_id"
    t.index ["asset_id"], name: "index_suggestions_on_asset_id"
    t.index ["suggestor_type", "suggestor_id"], name: "index_suggestions_on_suggestor"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "manager_id"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["manager_id"], name: "index_users_on_manager_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "activities", "suggestions"
  add_foreign_key "assets", "computers"
  add_foreign_key "assets", "laboratories"
  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "peripherals", "assets"
  add_foreign_key "peripherals", "computers"
  add_foreign_key "suggestions", "assets"
  add_foreign_key "users", "users", column: "manager_id"
end
