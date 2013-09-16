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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130916185247) do

  create_table "comparisons", :force => true do |t|
    t.string   "title"
    t.text     "notes"
    t.integer  "institution_id",  :precision => 38, :scale => 0
    t.decimal  "f1_weight",                                      :default => 1.0
    t.decimal  "f2_weight",                                      :default => 1.0
    t.decimal  "f3_weight",                                      :default => 1.0
    t.decimal  "f4_weight",                                      :default => 1.0
    t.decimal  "f5_weight",                                      :default => 1.0
    t.decimal  "f6_weight",                                      :default => 1.0
    t.decimal  "f7_weight",                                      :default => 1.0
    t.integer  "number_of_peers", :precision => 38, :scale => 0, :default => 10
    t.string   "state"
    t.string   "fips"
    t.string   "sector"
    t.string   "control"
    t.string   "deg_grant"
    t.string   "hbcu"
    t.string   "tribal"
    t.string   "locale"
    t.string   "land_grant"
    t.string   "carnegie"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "unit_id"
    t.string   "inst_name"
    t.decimal  "f1_size"
    t.decimal  "f2_cost"
    t.decimal  "f3_access"
    t.decimal  "f4_salary"
    t.decimal  "f5_libarts"
    t.decimal  "f6_ugcomp"
    t.decimal  "f7_expend"
    t.string   "state"
    t.string   "fips"
    t.string   "sector"
    t.string   "control"
    t.string   "deg_grant"
    t.string   "hbcu"
    t.string   "tribal"
    t.string   "locale"
    t.string   "land_grant"
    t.string   "carnegie"
    t.string   "year"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "website"
    t.string   "county_code"
    t.string   "county"
    t.decimal  "longitude"
    t.decimal  "latitude"
  end

  create_table "ipeds_institution_details", :id => false, :force => true do |t|
    t.string "unitid",   :limit => 6
    t.string "addr",     :limit => 65
    t.string "city",     :limit => 23
    t.string "stabbr",   :limit => 2
    t.string "zip",      :limit => 10
    t.string "webaddr",  :limit => 143
    t.string "countycd", :limit => 5
    t.string "countynm", :limit => 30
    t.string "cngdstcd", :limit => 4
    t.string "longitud", :limit => 18
    t.string "latitude", :limit => 18
    t.string "location", :limit => 111
  end

end
