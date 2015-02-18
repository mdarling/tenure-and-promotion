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

ActiveRecord::Schema.define(version: 20150218043339) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id"

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "converts", force: :cascade do |t|
    t.string   "download"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.datetime "download_updated_at"
    t.integer  "upload_id"
  end

  add_index "converts", ["category_id"], name: "index_converts_on_category_id"
  add_index "converts", ["upload_id"], name: "index_converts_on_upload_id"

  create_table "department_sections", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "section_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "department_sections", ["department_id"], name: "index_department_sections_on_department_id"
  add_index "department_sections", ["section_id"], name: "index_department_sections_on_section_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "departments", ["college_id"], name: "index_departments_on_college_id"

  create_table "fullcalendar_engine_event_series", force: :cascade do |t|
    t.integer  "frequency",  default: 1
    t.string   "period",     default: "monthly"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fullcalendar_engine_events", force: :cascade do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         default: false
    t.text     "description"
    t.integer  "event_series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fullcalendar_engine_events", ["event_series_id"], name: "index_fullcalendar_engine_events_on_event_series_id"

  create_table "recusals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "candidate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recusals", ["candidate_id"], name: "index_recusals_on_candidate_id"
  add_index "recusals", ["user_id"], name: "index_recusals_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.boolean  "pdf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uploads", ["category_id"], name: "index_uploads_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "netid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.integer  "role_id"
    t.string   "dossier_file_name"
    t.string   "dossier_content_type"
    t.integer  "dossier_file_size"
    t.datetime "dossier_updated_at"
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
