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

ActiveRecord::Schema[7.1].define(version: 2023_12_05_030826) do
  create_table "addresses", force: :cascade do |t|
    t.string "block"
    t.string "lot"
    t.string "street"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "monthly_due_transactions", force: :cascade do |t|
    t.string "is_paid"
    t.integer "user_id"
    t.integer "monthly_due_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monthly_due_id"], name: "index_monthly_due_transactions_on_monthly_due_id"
    t.index ["user_id"], name: "index_monthly_due_transactions_on_user_id"
  end

  create_table "monthly_dues", force: :cascade do |t|
    t.string "amount"
    t.string "is_current"
    t.integer "subdivision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdivision_id"], name: "index_monthly_dues_on_subdivision_id"
  end

  create_table "subdivisions", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.integer "subdivision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdivision_id"], name: "index_users_on_subdivision_id"
  end

  create_table "water_billing_transactions", force: :cascade do |t|
    t.string "current_reading"
    t.string "previous_reading"
    t.integer "user_id"
    t.integer "subdivision_id"
    t.integer "water_billing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdivision_id"], name: "index_water_billing_transactions_on_subdivision_id"
    t.index ["user_id"], name: "index_water_billing_transactions_on_user_id"
    t.index ["water_billing_id"], name: "index_water_billing_transactions_on_water_billing_id"
  end

  create_table "water_billings", force: :cascade do |t|
    t.string "per_cubic_price"
    t.string "is_current_price"
    t.integer "subdivision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdivision_id"], name: "index_water_billings_on_subdivision_id"
  end

end
