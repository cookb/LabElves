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

ActiveRecord::Schema.define(:version => 20130905181508) do

  create_table "bids", :force => true do |t|
    t.integer  "task_id",     :null => false
    t.integer  "elf_id",      :null => false
    t.integer  "credits_bid", :null => false
    t.datetime "time_bid",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "bids", ["elf_id"], :name => "index_volunteers_on_elf_id"
  add_index "bids", ["task_id"], :name => "index_volunteers_on_task_id"

  create_table "reviews", :force => true do |t|
    t.integer  "task_id",    :null => false
    t.string   "title"
    t.text     "comments"
    t.boolean  "endorse"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reviews", ["task_id"], :name => "index_reviews_on_task_id"

  create_table "spec_joins", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "spec_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spec_joins", ["spec_id"], :name => "index_spec_joins_on_spec_id"
  add_index "spec_joins", ["user_id"], :name => "index_spec_joins_on_user_id"

  create_table "specialties", :force => true do |t|
    t.integer  "author_id",   :null => false
    t.integer  "parent_id"
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "specialties", ["name"], :name => "index_specialties_on_name", :unique => true
  add_index "specialties", ["parent_id"], :name => "index_specialties_on_parent_id"

  create_table "tasks", :force => true do |t|
    t.string   "status",     :null => false
    t.integer  "user_id",    :null => false
    t.integer  "elf_id"
    t.integer  "spec_id",    :null => false
    t.string   "subject",    :null => false
    t.text     "body",       :null => false
    t.integer  "duration",   :null => false
    t.string   "location",   :null => false
    t.string   "lat_long"
    t.integer  "credits",    :null => false
    t.datetime "time_start", :null => false
    t.datetime "time_end",   :null => false
    t.datetime "time_final"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tasks", ["elf_id"], :name => "index_tasks_on_elf_id"
  add_index "tasks", ["lat_long"], :name => "index_tasks_on_lat_long"
  add_index "tasks", ["spec_id"], :name => "index_tasks_on_spec_id"
  add_index "tasks", ["time_end"], :name => "index_tasks_on_time_end"
  add_index "tasks", ["time_final"], :name => "index_tasks_on_time_final"
  add_index "tasks", ["time_start"], :name => "index_tasks_on_time_start"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name",                                   :null => false
    t.string   "location",                               :null => false
    t.string   "education",                              :null => false
    t.string   "institution"
    t.string   "link"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "lat_long"
    t.integer  "credits",                :default => 0
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["location"], :name => "index_users_on_location"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
