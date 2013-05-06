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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130503070520) do

  create_table "client_users", :force => true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "client_name"
    t.string   "romaji_name"
    t.string   "tel"
    t.string   "department_name"
    t.integer  "contract_flg"
    t.integer  "contract_type"
    t.integer  "del_flg",         :default => 1
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "clients", ["client_name"], :name => "index_clients_on_client_name", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "role_name"
    t.integer  "active_flg", :default => 1
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "roles", ["role_name"], :name => "index_roles_on_role_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "fullname"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "role_id"
    t.datetime "last_login"
    t.string   "language"
    t.integer  "status",          :default => 1
    t.integer  "password_flg"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
