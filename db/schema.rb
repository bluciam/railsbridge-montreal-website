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

ActiveRecord::Schema.define(version: 20140404014558) do

  create_table "checks", force: true do |t|
    t.string   "email"
    t.string   "ruby_version"
    t.string   "ruby_platform"
    t.datetime "created_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "language"
    t.string   "teachers"
    t.string   "room"
    t.string   "event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "bringing_laptop"
    t.text     "special_needs"
    t.string   "level"
    t.string   "language"
    t.datetime "cancelled_at"
    t.boolean  "waitlisted",      default: false
    t.integer  "course_id"
    t.integer  "edition_id"
  end

end
