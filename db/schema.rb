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

ActiveRecord::Schema.define(version: 20140216015153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: true do |t|
    t.boolean "req_status"
    t.integer "fy"
    t.integer "quarter"
    t.integer "aa"
    t.string  "sector"
    t.string  "country"
    t.string  "req_id"
    t.integer "vol_requested"
    t.string  "project_title"
    t.text    "project_description"
    t.string  "language"
    t.date    "nomination_deadline"
    t.date    "invitation_deadline"
    t.date    "staging_date"
    t.text    "conditions"
    t.text    "conditions_comments"
    t.text    "skills"
  end

end
