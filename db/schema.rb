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

ActiveRecord::Schema.define(version: 20170607015207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.integer "agency_id",       default: 0, null: false
    t.string  "agency_name",                 null: false
    t.string  "agency_url",                  null: false
    t.string  "agency_timezone",             null: false
    t.string  "agency_lang"
    t.string  "agency_phone"
    t.string  "agency_fare_url"
    t.string  "agency_email"
    t.integer "feed_id",                     null: false
  end

  create_table "calendar_dates", force: :cascade do |t|
    t.string  "service_id",     null: false
    t.date    "date",           null: false
    t.integer "exception_type", null: false
    t.integer "feed_id",        null: false
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
    t.integer "feed_id",    null: false
  end

  create_table "fare_attributes", force: :cascade do |t|
    t.string  "fare_id",           null: false
    t.float   "price",             null: false
    t.string  "currency_type",     null: false
    t.integer "payment_method",    null: false
    t.integer "transfers",         null: false
    t.integer "transfer_duration"
    t.integer "feed_id",           null: false
  end

  create_table "fare_rules", force: :cascade do |t|
    t.string  "fare_id",        null: false
    t.string  "route_id"
    t.string  "origin_id"
    t.string  "destination_id"
    t.string  "contains_id"
    t.integer "feed_id",        null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.string "feed_publisher_name", null: false
    t.string "feed_publisher_url",  null: false
    t.string "feed_lang",           null: false
    t.date   "feed_start_date"
    t.date   "feed_end_date"
    t.string "feed_version"
  end

  create_table "frequencies", force: :cascade do |t|
    t.string  "trip_id",                      null: false
    t.string  "start_time",                   null: false
    t.string  "end_time",                     null: false
    t.string  "headway_secs",                 null: false
    t.boolean "exact_times",  default: false, null: false
    t.integer "feed_id",                      null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "route_long_name",              null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "description"
    t.string   "route_id",                     null: false
    t.integer  "route_type",                   null: false
    t.string   "route_short_name",             null: false
    t.string   "route_color"
    t.string   "route_url"
    t.integer  "agency_id",        default: 0, null: false
    t.string   "route_text_color"
    t.integer  "feed_id",                      null: false
  end

  create_table "shapes", force: :cascade do |t|
    t.string  "shape_id",            null: false
    t.decimal "shape_pt_lat",        null: false
    t.decimal "shape_pt_lon",        null: false
    t.integer "shape_pt_sequence",   null: false
    t.float   "shape_dist_traveled"
    t.integer "feed_id",             null: false
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
    t.integer  "feed_id",          null: false
    t.index ["route_id"], name: "index_stations_on_route_id", using: :btree
  end

  create_table "stop_times", force: :cascade do |t|
    t.string  "trip_id",                         null: false
    t.string  "arrival_time"
    t.string  "departure_time"
    t.string  "stop_id",                         null: false
    t.integer "stop_sequence",                   null: false
    t.string  "stop_headsign"
    t.integer "pickup_type",         default: 0
    t.integer "drop_off_type",       default: 0
    t.float   "shape_dist_traveled"
    t.integer "timepoint"
    t.integer "feed_id",                         null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string  "stop_id",             null: false
    t.string  "stop_code"
    t.string  "stop_name",           null: false
    t.text    "stop_desc"
    t.decimal "stop_lat",            null: false
    t.decimal "stop_lon",            null: false
    t.string  "zone_id"
    t.string  "stop_url"
    t.integer "location_type"
    t.string  "parent_station"
    t.string  "stop_timezone"
    t.integer "wheelchair_boarding"
    t.integer "feed_id",             null: false
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

  create_table "transfers", force: :cascade do |t|
    t.string  "from_stop_id",      null: false
    t.string  "to_stop_id",        null: false
    t.integer "transfer_type",     null: false
    t.integer "min_transfer_time"
    t.integer "feed_id",           null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string  "route_id",              null: false
    t.string  "service_id",            null: false
    t.string  "trip_id",               null: false
    t.string  "trip_headsign"
    t.string  "trip_short_name"
    t.integer "direction_id"
    t.string  "block_id"
    t.string  "shape_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.integer "feed_id",               null: false
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
