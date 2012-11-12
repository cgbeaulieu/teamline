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

ActiveRecord::Schema.define(:version => 20121112155038) do

  create_table "gh_events", :force => true do |t|
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "category"
    t.string   "content"
    t.date     "published_at", :limit => 255
    t.string   "username"
    t.integer  "person_id"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "rss_feed"
    t.string   "twitter_handle"
    t.string   "gh_username"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "gh_events", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "category"
    t.string   "content"
    t.string   "eventdate"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.date     "published_at"
    t.integer  "person_id"
  end

  create_table "tweets", :force => true do |t|
    t.text     "content"
    t.date     "published_at"
    t.string   "handle"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "person_id"
  end

end
