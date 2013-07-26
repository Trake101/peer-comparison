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

ActiveRecord::Schema.define(:version => 20130624155159) do

  create_table "comparisons", :force => true do |t|
    t.string   "title"
    t.text     "notes"
    t.integer  "institution_id"
    t.float    "f1_weight",       :default => 1.0
    t.float    "f2_weight",       :default => 1.0
    t.float    "f3_weight",       :default => 1.0
    t.float    "f4_weight",       :default => 1.0
    t.float    "f5_weight",       :default => 1.0
    t.float    "f6_weight",       :default => 1.0
    t.float    "f7_weight",       :default => 1.0
    t.integer  "number_of_peers", :default => 10
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "unit_id"
    t.string   "inst_name"
    t.float    "f1_size"
    t.float    "f2_cost"
    t.float    "f3_access"
    t.float    "f4_salary"
    t.float    "f5_libarts"
    t.float    "f6_ugcomp"
    t.float    "f7_expend"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end