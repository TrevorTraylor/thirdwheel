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

ActiveRecord::Schema.define(version: 20151028074345) do

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "profilepics", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profilepics", ["user_id"], name: "index_profilepics_on_user_id"

  create_table "profilpics", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "remote_image_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profilpics", ["user_id"], name: "index_profilpics_on_user_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
