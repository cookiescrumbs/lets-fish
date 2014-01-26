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

ActiveRecord::Schema.define(version: 20140126120800) do

  create_table "fisheries", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "line2"
    t.string   "city"
    t.string   "region"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fish", force: true do |t|
    t.string   "species"
    t.float    "weight"
    t.integer  "return_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fish", ["return_id"], name: "index_fish_on_return_id"

  create_table "returns", force: true do |t|
    t.text     "description"
    t.integer  "fisherman_id"
    t.integer  "ticket_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "returns", ["fisherman_id"], name: "index_returns_on_fisherman_id"
  add_index "returns", ["ticket_type_id"], name: "index_returns_on_ticket_type_id"

end
