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

ActiveRecord::Schema.define(version: 2019_01_05_144411) do

  create_table "nikkis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "value", null: false
    t.datetime "datetime", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["datetime"], name: "index_nikkis_on_datetime"
    t.index ["user_id"], name: "index_nikkis_on_user_id"
    t.index ["value"], name: "index_nikkis_on_value"
  end

  create_table "omniauth_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.string "uid", null: false
    t.integer "provider", default: 0, null: false
    t.string "name", null: false
    t.string "image"
    t.string "description"
    t.string "email"
    t.string "token", null: false
    t.string "refresh_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_omniauth_profiles_on_description"
    t.index ["email"], name: "index_omniauth_profiles_on_email"
    t.index ["image"], name: "index_omniauth_profiles_on_image"
    t.index ["name"], name: "index_omniauth_profiles_on_name"
    t.index ["provider"], name: "index_omniauth_profiles_on_provider"
    t.index ["refresh_token"], name: "index_omniauth_profiles_on_refresh_token"
    t.index ["token"], name: "index_omniauth_profiles_on_token"
    t.index ["uid"], name: "index_omniauth_profiles_on_uid"
    t.index ["user_id"], name: "index_omniauth_profiles_on_user_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "uid", null: false
    t.integer "provider", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid", "provider"], name: "index_profiles_on_uid_and_provider"
  end

  create_table "reminders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "value", null: false
    t.datetime "execute_time", null: false
    t.boolean "is_finished", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["execute_time"], name: "index_reminders_on_execute_time"
    t.index ["is_finished"], name: "index_reminders_on_is_finished"
    t.index ["user_id"], name: "index_reminders_on_user_id"
    t.index ["value"], name: "index_reminders_on_value"
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "value", null: false
    t.datetime "date_time", null: false
    t.boolean "is_done", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_time"], name: "index_tasks_on_date_time"
    t.index ["is_done"], name: "index_tasks_on_is_done"
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["value"], name: "index_tasks_on_value"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "omniauth_profiles", "users"
end
