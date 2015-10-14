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

ActiveRecord::Schema.define(version: 20151013074929) do

  create_table "addresses", force: true do |t|
    t.integer  "fishery_id"
    t.string   "street"
    t.string   "line2"
    t.string   "region"
    t.string   "country"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["fishery_id"], name: "index_addresses_on_fishery_id"

  create_table "contact_details", force: true do |t|
    t.integer  "fishery_id"
    t.string   "name"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_details", ["fishery_id"], name: "index_contact_details_on_fishery_id"

  create_table "fisheries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species_waters", id: false, force: true do |t|
    t.integer "species_id"
    t.integer "water_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "water_types", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "waters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "season_start"
    t.date     "season_end"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "water_type_id"
    t.integer  "fishery_id"
    t.text     "address"
  end

  add_index "waters", ["fishery_id"], name: "index_waters_on_fishery_id"

end
