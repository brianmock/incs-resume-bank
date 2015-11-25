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

ActiveRecord::Schema.define(version: 20151124210518) do

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

  create_table "resumes", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["teacher_id"], name: "index_resumes_on_teacher_id", using: :btree

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
    t.string   "grade_pref"
    t.boolean  "previous"
    t.boolean  "relocation"
    t.string   "password_digest"
    t.string   "access"
    t.string   "additional"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
