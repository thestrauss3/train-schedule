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

ActiveRecord::Schema.define(version: 20170602153340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.integer "agency_id", default: 0, null: false
    t.string  "name",                  null: false
    t.string  "url",                   null: false
    t.string  "timezone",              null: false
    t.string  "lang"
    t.string  "phone"
    t.string  "fare_url"
    t.string  "email"
  end

  create_table "calendar_dates", force: :cascade do |t|
    t.string  "service_id",     null: false
    t.date    "date",           null: false
    t.boolean "exception_type", null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string  "service_id", null: false
    t.boolean "monday",     null: false
    t.boolean "tuesday",    null: false
    t.boolean "wednesday",  null: false
    t.boolean "thursday",   null: false
    t.boolean "friday",     null: false
    t.boolean "saturday",   null: false
    t.boolean "sunday",     null: false
    t.date    "start_date", null: false
    t.date    "end_date",   null: false
  end

  create_table "fare_attributes", force: :cascade do |t|
    t.string  "fare_id",           null: false
    t.float   "price",             null: false
    t.string  "currency_type",     null: false
    t.integer "payment_method",    null: false
    t.integer "transfers",         null: false
    t.integer "transfer_duration"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "long_name",                    null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "description"
    t.string   "route_id",                     null: false
    t.integer  "route_type",                   null: false
    t.string   "short_name",                   null: false
    t.string   "route_color"
    t.string   "route_url"
    t.string   "authority",                    null: false
    t.string   "city",                         null: false
    t.integer  "agency_id",        default: 0, null: false
    t.string   "route_text_color"
  end

  create_table "stations", force: :cascade do |t|
    t.string   "stop_name",        null: false
    t.string   "route_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "stop_order",       null: false
    t.string   "stop_id",          null: false
    t.string   "parent_stop_id"
    t.string   "parent_stop_name"
    t.float    "stop_lat"
    t.float    "stop_lon"
    t.integer  "direction_id"
    t.string   "direction_name"
    t.string   "route_name"
    t.index ["route_id"], name: "index_stations_on_route_id", using: :btree
  end

  create_table "train_stops", force: :cascade do |t|
    t.integer  "train_id",   null: false
    t.integer  "station_id", null: false
    t.time     "stop_time",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_train_stops_on_station_id", using: :btree
    t.index ["train_id"], name: "index_train_stops_on_train_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "trip_name",      null: false
    t.string   "route_id",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "trip_id",        null: false
    t.string   "route_name",     null: false
    t.integer  "direction_id",   null: false
    t.string   "direction_name", null: false
    t.string   "route_type",     null: false
    t.string   "mode_name",      null: false
    t.index ["route_id"], name: "index_trips_on_route_id", using: :btree
  end

  create_table "user_favorite_lines", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "line_id"
    t.index ["user_id"], name: "index_user_favorite_lines_on_user_id", using: :btree
  end

  create_table "user_favorite_stations", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "station_id"
    t.string   "line_id",    null: false
    t.index ["user_id"], name: "index_user_favorite_stations_on_user_id", using: :btree
  end

  create_table "user_favorite_trains", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "train_num"
    t.string   "line_id",    null: false
    t.index ["user_id"], name: "index_user_favorite_trains_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",     null: false
    t.string   "uid",          null: false
    t.string   "username",     null: false
    t.string   "email",        null: false
    t.string   "avatar_url"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
  end

end
