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

ActiveRecord::Schema.define(version: 20141020183650) do

  create_table "fisheries", force: true do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "street"
    t.string   "line2"
    t.string   "line3"
    t.string   "region"
    t.string   "country"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fisheries_insects", id: false, force: true do |t|
    t.integer "fishery_id"
    t.integer "insect_id"
  end

  create_table "fisheries_species", id: false, force: true do |t|
    t.integer "fishery_id"
    t.integer "species_id"
  end

  create_table "insects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "waters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "prices"
    t.date     "season_start"
    t.date     "season_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fisheries_id"
    t.float    "longitude"
    t.float    "latitude"
  end

  add_index "waters", ["fisheries_id"], name: "index_waters_on_fisheries_id"

end
