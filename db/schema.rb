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

ActiveRecord::Schema.define(version: 20170909174820) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.string "name"
    t.integer "school_id"
    t.integer "role"
    t.string "phone"
    t.string "photo"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_admins_on_school_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string "text"
    t.boolean "correct", default: false
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "cronometer_logs", force: :cascade do |t|
    t.integer "discipline_id"
    t.integer "time"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["discipline_id"], name: "index_cronometer_logs_on_discipline_id"
    t.index ["student_id"], name: "index_cronometer_logs_on_student_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discipline_type"
    t.string "nick_name"
  end

  create_table "productivities", force: :cascade do |t|
    t.integer "total_questions"
    t.integer "correct_questions"
    t.integer "time_studed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discipline_id"
    t.integer "student_id"
    t.datetime "date"
    t.index ["discipline_id"], name: "index_productivities_on_discipline_id"
    t.index ["student_id"], name: "index_productivities_on_student_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "number"
    t.integer "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.integer "discipline_id"
    t.index ["discipline_id"], name: "index_questions_on_discipline_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "questions_topics", id: false, force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "question_id", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_quizzes_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "cep"
    t.string "address"
    t.string "cnpj"
    t.string "social_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "school_type"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.string "email"
    t.string "password_digest"
    t.string "registration"
    t.integer "gender"
    t.string "birthday"
    t.integer "student_class"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.integer "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_topics_on_discipline_id"
  end

end
