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

ActiveRecord::Schema.define(version: 20160526222315) do

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dish_categories", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "restaurant_owner_id", limit: 4
  end

  add_index "dish_categories", ["restaurant_owner_id"], name: "index_dish_categories_on_restaurant_owner_id", using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.float    "price",               limit: 24
    t.text     "description",         limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "dish_category_id",    limit: 4
    t.integer  "restaurant_owner_id", limit: 4
    t.boolean  "active",              limit: 1,     default: true
  end

  add_index "dishes", ["dish_category_id"], name: "index_dishes_on_dish_category_id", using: :btree
  add_index "dishes", ["restaurant_owner_id"], name: "index_dishes_on_restaurant_owner_id", using: :btree

  create_table "favorite_restaurants", force: :cascade do |t|
    t.integer  "customer_id",   limit: 4
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "favorite_restaurants", ["customer_id"], name: "index_favorite_restaurants_on_customer_id", using: :btree
  add_index "favorite_restaurants", ["restaurant_id"], name: "index_favorite_restaurants_on_restaurant_id", using: :btree

  create_table "menu_dishes", force: :cascade do |t|
    t.integer  "dish_id",    limit: 4
    t.integer  "menu_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "menu_dishes", ["dish_id"], name: "index_menu_dishes_on_dish_id", using: :btree
  add_index "menu_dishes", ["menu_id"], name: "index_menu_dishes_on_menu_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "restaurant_owner_id", limit: 4
  end

  add_index "order_statuses", ["restaurant_owner_id"], name: "index_order_statuses_on_restaurant_owner_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.float    "total_price", limit: 24
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "table_id",    limit: 4
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["table_id"], name: "index_orders_on_table_id", using: :btree

  create_table "restaurant_owners", force: :cascade do |t|
    t.string   "telephone",  limit: 255
    t.string   "NIP",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "street",              limit: 255
    t.string   "house_number",        limit: 255
    t.integer  "apartment_number",    limit: 4
    t.string   "post_code",           limit: 255
    t.string   "city",                limit: 255
    t.boolean  "active",              limit: 1
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "restaurant_owner_id", limit: 4
    t.boolean  "open",                limit: 1,   default: true
  end

  add_index "restaurants", ["restaurant_owner_id"], name: "index_restaurants_on_restaurant_owner_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.string   "QR_code",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "restaurant_id", limit: 4
    t.integer  "number",        limit: 4
  end

  add_index "tables", ["restaurant_id"], name: "index_tables_on_restaurant_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "auth_token",             limit: 255
    t.string   "login",                  limit: 255
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.integer  "actable_id",             limit: 4
    t.string   "actable_type",           limit: 255
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "waiters", force: :cascade do |t|
    t.integer  "restaurant_owner_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "restaurant_id",       limit: 4
    t.string   "telephone",           limit: 255
  end

  add_index "waiters", ["restaurant_id"], name: "index_waiters_on_restaurant_id", using: :btree
  add_index "waiters", ["restaurant_owner_id"], name: "index_waiters_on_restaurant_owner_id", using: :btree

  add_foreign_key "dish_categories", "restaurant_owners"
  add_foreign_key "dishes", "dish_categories"
  add_foreign_key "dishes", "restaurant_owners"
  add_foreign_key "favorite_restaurants", "customers"
  add_foreign_key "favorite_restaurants", "restaurants"
  add_foreign_key "menu_dishes", "dishes"
  add_foreign_key "menu_dishes", "menus"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "order_statuses", "restaurant_owners"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "tables"
  add_foreign_key "restaurants", "restaurant_owners"
  add_foreign_key "tables", "restaurants"
  add_foreign_key "waiters", "restaurant_owners"
  add_foreign_key "waiters", "restaurants"
end
