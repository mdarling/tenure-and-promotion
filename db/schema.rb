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

ActiveRecord::Schema.define(version: 20140729190625) do

  create_table "candidate_profiles", force: true do |t|
    t.text     "Curriculum_Vitae"
    t.text     "Teaching_Statement"
    t.text     "Research_Statement"
    t.text     "Service_statement_in"
    t.text     "Additional_Materials"
    t.integer  "user_id"
    t.integer  "User_department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidate_profiles", ["User_department_id"], name: "index_candidate_profiles_on_User_department_id"
  add_index "candidate_profiles", ["user_id"], name: "index_candidate_profiles_on_user_id"

  create_table "colleges", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "committee_evaluations", force: true do |t|
    t.integer  "committee_id"
    t.integer  "committee_department_id"
    t.integer  "committee_department_college_id"
    t.integer  "review_id"
    t.integer  "review_candidate_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "committee_evaluations", ["committee_department_college_id"], name: "index_committee_evaluations_on_committee_department_college_id"
  add_index "committee_evaluations", ["committee_department_id"], name: "index_committee_evaluations_on_committee_department_id"
  add_index "committee_evaluations", ["committee_id"], name: "index_committee_evaluations_on_committee_id"
  add_index "committee_evaluations", ["review_candidate_profile_id"], name: "index_committee_evaluations_on_review_candidate_profile_id"
  add_index "committee_evaluations", ["review_id"], name: "index_committee_evaluations_on_review_id"

  create_table "committees", force: true do |t|
    t.integer  "committee_id"
    t.string   "name"
    t.integer  "department_id"
    t.integer  "department_college_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "committees", ["department_college_id"], name: "index_committees_on_department_college_id"
  add_index "committees", ["department_id"], name: "index_committees_on_department_id"

  create_table "converts", force: true do |t|
    t.string   "cid"
    t.string   "url"
    t.string   "step"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "department_admin_views", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.integer  "College_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["College_id"], name: "index_departments_on_college_id"

  create_table "homes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "candidate_profile_id"
    t.datetime "begin"
    t.datetime "end"
    t.string   "college_type"
    t.integer  "committee_id"
    t.integer  "committee_department_id"
    t.integer  "committee_department_college_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["candidate_profile_id"], name: "index_reviews_on_candidate_profile_id"
  add_index "reviews", ["committee_department_college_id"], name: "index_reviews_on_committee_department_college_id"
  add_index "reviews", ["committee_department_id"], name: "index_reviews_on_committee_department_id"
  add_index "reviews", ["committee_id"], name: "index_reviews_on_committee_id"

  create_table "sends", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sign_ins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "acces_level"
    t.integer  "Department_id"
    t.boolean  "is_faculty"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "Committee_id"
    t.integer  "Department_College_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["Committee_id"], name: "index_users_on_Committee_id"
  add_index "users", ["Department_College_id"], name: "index_users_on_Department_College_id"
  add_index "users", ["Department_id"], name: "index_users_on_Department_id"

  create_table "votes", force: true do |t|
    t.integer  "vote_id"
    t.integer  "Review_id"
    t.integer  "Review_Candidate_Profile_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["Review_Candidate_Profile_id"], name: "index_votes_on_Review_Candidate_Profile_id"
  add_index "votes", ["Review_id"], name: "index_votes_on_Review_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
