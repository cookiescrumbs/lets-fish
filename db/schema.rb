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

ActiveRecord::Schema.define(version: 20190627061026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
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
    t.index ["fishery_id"], name: "index_addresses_on_fishery_id", using: :btree
  end

  create_table "contact_details", force: :cascade do |t|
    t.integer  "fishery_id"
    t.string   "name"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["fishery_id"], name: "index_contact_details_on_fishery_id", using: :btree
  end

  create_table "fisheries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "description"
    t.integer  "map_zoom_level"
    t.boolean  "published",          default: false
    t.integer  "membership_id"
    t.text     "permission_tickets"
    t.index ["slug"], name: "index_fisheries_on_slug", unique: true, using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "water_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "geograph_photo_id"
    t.boolean  "hero",               default: false
    t.jsonb    "attribution",        default: {},    null: false
    t.index ["attribution"], name: "index_images_on_attribution", using: :gin
    t.index ["water_id"], name: "index_images_on_water_id", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.jsonb    "details",    default: "{}", null: false
    t.index ["details"], name: "index_memberships_on_details", using: :gin
  end

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species_waters", id: false, force: :cascade do |t|
    t.integer "species_id"
    t.integer "water_id"
  end

  create_table "user_fisheries", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "fishery_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "water_types", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "waters", force: :cascade do |t|
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
    t.json     "annotation",         default: "{}",  null: false
    t.boolean  "published",          default: false
    t.text     "permission_tickets"
    t.boolean  "featured",           default: false
    t.index ["fishery_id"], name: "index_waters_on_fishery_id", using: :btree
    t.index ["slug"], name: "index_waters_on_slug", unique: true, using: :btree
  end

  add_foreign_key "waters", "fisheries", on_delete: :cascade
end
