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

ActiveRecord::Schema.define(version: 2019_08_02_120823) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "salary"
    t.string "about"
    t.string "comment"
    t.integer "user_id"
    t.integer "job_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.time "time"
    t.date "date"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "interview_confirmation", default: false
    t.integer "status"
    t.integer "application_id"
    t.index ["application_id"], name: "index_interviews_on_application_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "company_name"
    t.string "title"
    t.string "description"
    t.string "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "job_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "slack"
    t.string "github"
    t.string "fb"
    t.string "twitter"
    t.string "linkedin"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
