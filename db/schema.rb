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

ActiveRecord::Schema.define(version: 20190520221828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medical_recommendations", force: :cascade do |t|
    t.integer "recommendation_number"
    t.string "issuer"
    t.string "state"
    t.date "expiration_date"
    t.string "path_to_image"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_medical_recommendations_on_user_id"
  end

  create_table "state_ids", force: :cascade do |t|
    t.integer "id_number"
    t.string "state"
    t.date "expiration_date"
    t.string "path_to_image"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_state_ids_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "medical_recommendations", "users"
  add_foreign_key "state_ids", "users"
end
