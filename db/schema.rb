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

ActiveRecord::Schema.define(version: 20171229205506) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "appointments", force: :cascade do |t|
    t.integer  "day_id"
    t.integer  "slot_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "delivery_id"
  end

  create_table "days", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "delivery_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "user_packnum"
    t.integer  "order_id"
    t.decimal  "order_qty"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.integer  "member_id",       null: false
    t.string   "member_type",     null: false
    t.integer  "group_id"
    t.string   "group_type"
    t.string   "group_name"
    t.string   "membership_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_memberships", ["group_name"], name: "index_group_memberships_on_group_name"
  add_index "group_memberships", ["group_type", "group_id"], name: "index_group_memberships_on_group_type_and_group_id"
  add_index "group_memberships", ["member_type", "member_id"], name: "index_group_memberships_on_member_type_and_member_id"

  create_table "groups", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invites", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.integer  "user_group_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_qty"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "product_id"
    t.integer  "order_status_id",   default: 1
    t.integer  "subcription_id"
    t.text     "order_description"
    t.string   "order_size"
  end

  create_table "pickups", force: :cascade do |t|
    t.integer  "shopper_id"
    t.integer  "driver_id"
    t.string   "prod_size"
    t.string   "user_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "plan_name"
    t.text     "plan_descrip"
    t.text     "plan_info"
    t.decimal  "plan_price"
    t.string   "plan_image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "plan_info1"
    t.string   "sku"
  end

  create_table "products", force: :cascade do |t|
    t.string   "prod_name"
    t.string   "description"
    t.decimal  "price"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "sku"
    t.decimal  "total_price"
  end

  create_table "promos", force: :cascade do |t|
    t.string   "code"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "email"
    t.integer  "amount"
    t.string   "description"
    t.string   "currency"
    t.string   "customer_id"
    t.string   "card"
    t.integer  "product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "uuid"
    t.integer  "order_qty"
    t.integer  "order_num"
    t.integer  "subscription_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "delivery_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.date     "day"
    t.integer  "slot_id"
    t.integer  "delivery_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "window"
    t.integer  "subscription_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string   "window"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "day_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sku"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image",                  default: "default-profile.png"
    t.boolean  "shopper",                default: true
    t.boolean  "driver",                 default: false
    t.integer  "role_id",                default: 2
    t.string   "packs_num"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "zipcode"
    t.string   "promo_code"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
