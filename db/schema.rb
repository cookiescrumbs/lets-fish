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

ActiveRecord::Schema.define(version: 20160814094415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer  "fishery_id"
    t.string   "street"
    t.string   "line2"
    t.string   "region"
    t.string   "country"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "addresses", ["fishery_id"], name: "index_addresses_on_fishery_id", using: :btree

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

  add_index "contact_details", ["fishery_id"], name: "index_contact_details_on_fishery_id", using: :btree

  create_table "fisheries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "place_id"
    t.string   "slug"
    t.text     "description"
  end

  add_index "fisheries", ["slug"], name: "index_fisheries_on_slug", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.integer  "water_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "geograph_photo_id"
  end

  add_index "images", ["water_id"], name: "index_images_on_water_id", using: :btree

  create_table "species", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species_waters", id: false, force: true do |t|
    t.integer "species_id"
    t.integer "water_id"
  end

  create_table "user_fisheries", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "fishery_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

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
    t.string   "slug"
  end

  add_index "waters", ["fishery_id"], name: "index_waters_on_fishery_id", using: :btree
  add_index "waters", ["slug"], name: "index_waters_on_slug", unique: true, using: :btree

end
