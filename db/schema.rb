# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_22_151341) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.integer "uploaded_by_id"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    t.index ["uploaded_by_id"], name: "index_active_storage_attachments_on_uploaded_by_id"
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "therapy_id"
    t.integer "cadence", default: 0
    t.integer "assignable_id"
    t.string "assignable_type"
    t.datetime "completed_at"
    t.index ["assignable_id", "assignable_type"], name: "index_assignments_on_assignable_id_and_assignable_type"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "inviter_id", null: false
    t.integer "invitee_id"
    t.string "status", default: "sent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitee_email"
    t.index ["invitee_id"], name: "index_invitations_on_invitee_id"
    t.index ["inviter_id"], name: "index_invitations_on_inviter_id"
  end

  create_table "need_ratings", force: :cascade do |t|
    t.integer "needs_record_id", null: false
    t.integer "need_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["need_id"], name: "index_need_ratings_on_need_id"
    t.index ["needs_record_id"], name: "index_need_ratings_on_needs_record_id"
  end

  create_table "needs", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needs_records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "completed_at"
    t.integer "status", default: 0
    t.integer "therapy_id"
    t.index ["user_id"], name: "index_needs_records_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "therapy_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["therapy_id"], name: "index_notes_on_therapy_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "slug"
    t.index ["slug"], name: "index_questionnaires_on_slug", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.integer "questionnaire_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "response_options"
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assignment_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "therapies", force: :cascade do |t|
    t.integer "individual_id", null: false
    t.integer "therapist_id", null: false
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["individual_id"], name: "index_therapies_on_individual_id"
    t.index ["therapist_id"], name: "index_therapies_on_therapist_id"
  end

  create_table "thought_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.integer "user_id", null: false
    t.integer "therapy_id"
    t.index ["user_id"], name: "index_thought_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "type"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_attachments", "users", column: "uploaded_by_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignments", "therapies"
  add_foreign_key "invitations", "users", column: "invitee_id"
  add_foreign_key "invitations", "users", column: "inviter_id"
  add_foreign_key "need_ratings", "needs"
  add_foreign_key "need_ratings", "needs_records"
  add_foreign_key "needs_records", "therapies"
  add_foreign_key "needs_records", "users"
  add_foreign_key "notes", "therapies"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "responses", "assignments"
  add_foreign_key "responses", "questions"
  add_foreign_key "therapies", "users", column: "individual_id"
  add_foreign_key "therapies", "users", column: "therapist_id"
  add_foreign_key "thought_records", "therapies"
  add_foreign_key "thought_records", "users"
end
