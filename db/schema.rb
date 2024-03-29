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

ActiveRecord::Schema.define(version: 20130419074755) do

  create_table "bookings", force: true do |t|
    t.integer  "tour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_seats",          default: 1
    t.boolean  "paid",               default: false
    t.string   "credit_card_number"
    t.string   "card_security_code"
    t.string   "card_name"
    t.integer  "card_exp_month"
    t.string   "card_exp_year"
    t.string   "confirmation_email"
    t.string   "billing_address"
    t.string   "billing_zipcode"
    t.string   "billing_state"
  end

  add_index "bookings", ["tour_id", "created_at"], name: "index_bookings_on_tour_id_and_created_at"

  create_table "tours", force: true do |t|
    t.string   "title"
    t.date     "tour_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_seats",              default: 1
    t.integer  "available_seats"
    t.integer  "price_cents",              default: 0,     null: false
    t.string   "price_currency",           default: "USD", null: false
    t.integer  "duration"
    t.string   "duration_before_typecast"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
