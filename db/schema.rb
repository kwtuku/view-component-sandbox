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

ActiveRecord::Schema[7.0].define(version: 2023_11_05_144600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "ancestry_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "my_string", null: false
    t.string "ancestry", null: false, collation: "C"
    t.integer "ancestry_depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_ancestry_items_on_ancestry"
  end

  create_table "my_list_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "my_string", null: false
    t.integer "my_scope", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_models", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "my_string", null: false
    t.text "my_text", null: false
    t.integer "my_integer", null: false
    t.bigint "my_bigint", null: false
    t.float "my_float", null: false
    t.decimal "my_decimal", null: false
    t.datetime "my_datetime", null: false
    t.time "my_time", null: false
    t.date "my_date", null: false
    t.boolean "my_boolean", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_pg_models", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "my_model_id", null: false
    t.binary "my_binary", null: false
    t.string "my_string_array", null: false, array: true
    t.text "my_text_array", null: false, array: true
    t.integer "my_integer_array", null: false, array: true
    t.json "my_json", null: false
    t.jsonb "my_jsonb", null: false
    t.daterange "my_daterange", null: false
    t.uuid "my_uuid", null: false
    t.interval "my_interval", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_model_id"], name: "index_my_pg_models_on_my_model_id"
  end

  create_table "my_ranked_models", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "my_string", null: false
    t.integer "my_scope", null: false
    t.integer "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nested_set_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "my_string", null: false
    t.uuid "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft"], name: "index_nested_set_items_on_lft"
    t.index ["parent_id"], name: "index_nested_set_items_on_parent_id"
    t.index ["rgt"], name: "index_nested_set_items_on_rgt"
  end

  create_table "repositories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "name", null: false
    t.string "description", default: "", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_repositories_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "my_pg_models", "my_models"
  add_foreign_key "nested_set_items", "nested_set_items", column: "parent_id"
  add_foreign_key "repositories", "users"
end
