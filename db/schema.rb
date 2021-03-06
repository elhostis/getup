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

ActiveRecord::Schema.define(version: 20160305085550) do

  create_table "activites", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publish",    default: false
    t.string   "slug"
  end

  create_table "news", force: true do |t|
    t.string   "intro"
    t.string   "more"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "image"
    t.boolean  "publish",    default: false
  end

  create_table "sousactivite_images", force: true do |t|
    t.string   "image",           limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sousactivite_id"
    t.string   "description"
    t.integer  "row_order",                    default: 0
  end

  add_index "sousactivite_images", ["sousactivite_id"], name: "index_sousactivite_images_on_sousactivite_id", using: :btree

  create_table "sousactivites", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.boolean  "publish",     default: false, null: false
    t.integer  "activite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sousactivites", ["activite_id"], name: "index_sousactivites_on_activite_id", using: :btree
  add_index "sousactivites", ["slug"], name: "index_sousactivites_on_slug", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
