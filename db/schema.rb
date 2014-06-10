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

ActiveRecord::Schema.define(version: 20140522222626) do

  create_table "fisheries", force: true do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "street"
    t.string   "line2"
    t.string   "region"
    t.string   "country"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "email"
    t.string   "website"
    t.float    "lng"
    t.float    "lat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "waters", force: true do |t|
    t.string  "name"
    t.float   "lng"
    t.float   "lat"
    t.integer "fishery_id"
  end

  add_index "waters", ["fishery_id"], name: "index_waters_on_fishery_id"

end
