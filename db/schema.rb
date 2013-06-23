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

ActiveRecord::Schema.define(:version => 20130622161748) do

  create_table "beers", :force => true do |t|
    t.integer  "brewery_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "breweries", :force => true do |t|
    t.text     "location_lookup"
    t.text     "description"
    t.string   "status_display"
    t.string   "locality"
    t.string   "website"
    t.string   "brewer_id"
    t.string   "country"
    t.string   "hours_of_operation"
    t.string   "location_type"
    t.string   "is_closed"
    t.string   "is_primary"
    t.string   "latlong"
    t.string   "sub_name"
    t.string   "location_type_display"
    t.integer  "year_opened"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
