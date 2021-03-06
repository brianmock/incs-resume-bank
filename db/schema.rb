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

ActiveRecord::Schema.define(version: 20190106232923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "endorsements", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "endorsements_completeds", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "endorsement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "endorsements_completeds", ["endorsement_id"], name: "index_endorsements_completeds_on_endorsement_id", using: :btree
  add_index "endorsements_completeds", ["teacher_id"], name: "index_endorsements_completeds_on_teacher_id", using: :btree

  create_table "licenses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses_helds", force: :cascade do |t|
    t.integer  "license_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "licenses_helds", ["license_id"], name: "index_licenses_helds_on_license_id", using: :btree
  add_index "licenses_helds", ["teacher_id"], name: "index_licenses_helds_on_teacher_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "memberships", ["organization_id"], name: "index_memberships_on_organization_id", using: :btree
  add_index "memberships", ["teacher_id"], name: "index_memberships_on_teacher_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "position_choices", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "position_choices", ["position_id"], name: "index_position_choices_on_position_id", using: :btree
  add_index "position_choices", ["teacher_id"], name: "index_position_choices_on_teacher_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "preferences", ["subject_id"], name: "index_preferences_on_subject_id", using: :btree
  add_index "preferences", ["teacher_id"], name: "index_preferences_on_teacher_id", using: :btree

  create_table "references", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "references", ["source_id"], name: "index_references_on_source_id", using: :btree
  add_index "references", ["teacher_id"], name: "index_references_on_teacher_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.string   "attachment"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["teacher_id"], name: "index_resumes_on_teacher_id", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string   "source_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "school"
    t.string   "prefix"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "street"
    t.string   "street_second"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "register"
    t.string   "il_licensed"
    t.string   "degree"
    t.string   "major"
    t.string   "masters_concentration"
    t.string   "years"
    t.text     "grade_pref",            default: [],              array: true
    t.boolean  "previous"
    t.boolean  "relocation"
    t.text     "location_pref",         default: [],              array: true
    t.string   "password_digest"
    t.string   "access"
    t.string   "additional"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "register2017"
    t.string   "register2018"
    t.string   "register2019"
    t.string   "job_title"
  end

  add_index "users", ["access"], name: "index_users_on_access", using: :btree
  add_index "users", ["first_name", "last_name"], name: "index_users_on_first_name_and_last_name", using: :btree
  add_index "users", ["school"], name: "index_users_on_school", using: :btree

end
