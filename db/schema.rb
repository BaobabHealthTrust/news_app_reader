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

ActiveRecord::Schema.define(version: 0) do

  create_table "category", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name",        limit: 100, null: false
    t.string "description",             null: false
    t.date   "date",                    null: false
  end

  create_table "media", primary_key: "media_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "news_id",                         null: false
    t.string  "filename",     limit: 100
    t.string  "content_type", limit: 100
    t.binary  "data",         limit: 4294967295
  end

  create_table "news", primary_key: "news_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title",                                                              null: false
    t.text     "body",       limit: 4294967295,                                      null: false
    t.string   "category",   limit: 60,                                              null: false
    t.date     "date",                                                               null: false
    t.datetime "created_at",                    default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tracker", primary_key: "tracker_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "news_id",                                                     null: false
    t.string   "ip_address", limit: 20,                                       null: false
    t.string   "category",   limit: 100,                                      null: false
    t.date     "date",                                                        null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "user", primary_key: "user_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "fname",    limit: 100, null: false
    t.string "lname",    limit: 100, null: false
    t.string "username", limit: 100, null: false
    t.string "password", limit: 100, null: false
    t.date   "date"
  end

end
