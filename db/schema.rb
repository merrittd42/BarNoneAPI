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

ActiveRecord::Schema.define(version: 20161119201647) do

  create_table "bar_categories", force: :cascade do |t|
    t.string   "category",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bar_comments", force: :cascade do |t|
    t.integer  "bar_id"
    t.string   "commenter"
    t.text     "comment",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_comments_on_bar_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string   "name",                          null: false
    t.decimal  "latitude",                      null: false
    t.decimal  "longitude",                     null: false
    t.text     "description"
    t.integer  "rating",            default: 0
    t.integer  "loudness",          default: 0
    t.integer  "crowdedness",       default: 0
    t.string   "bar_category",                  null: false
    t.string   "address"
    t.integer  "person_count"
    t.integer  "rating_count",      default: 1, null: false
    t.integer  "loudness_count",    default: 1, null: false
    t.integer  "crowdedness_count", default: 1, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["latitude"], name: "index_bars_on_latitude"
    t.index ["longitude"], name: "index_bars_on_longitude"
    t.index ["person_count"], name: "index_bars_on_person_count"
  end

end
