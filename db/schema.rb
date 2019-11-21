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

ActiveRecord::Schema.define(version: 2019_11_21_164654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "garages", force: :cascade do |t|
    t.integer "capacity"
    t.text "description"
    t.string "location"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.integer "postale"
    t.string "full_address"
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_garages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "EUR", null: false
    t.string "checkout_session_id"
    t.bigint "user_id"
    t.bigint "garage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rental_id"
    t.index ["garage_id"], name: "index_orders_on_garage_id"
    t.index ["rental_id"], name: "index_orders_on_rental_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "garage_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_rentals_on_garage_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "garage_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_reviews_on_garage_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "photo"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "garages", "users"
  add_foreign_key "orders", "garages"
  add_foreign_key "orders", "rentals"
  add_foreign_key "orders", "users"
  add_foreign_key "rentals", "garages"
  add_foreign_key "rentals", "users"
  add_foreign_key "reviews", "garages"
  add_foreign_key "reviews", "users"
end
