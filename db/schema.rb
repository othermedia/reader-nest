# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090708110456) do

  create_table "searches", :force => true do |t|
    t.integer  "user_id"
    t.string   "phrase",     :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "searches", ["user_id"], :name => "index_searches_on_user_id"

  create_table "tweets", :force => true do |t|
    t.datetime "created_at", :null => false
    t.string   "user",       :null => false
    t.text     "text",       :null => false
  end

  add_index "tweets", ["user", "created_at"], :name => "index_tweets_on_user_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "username",      :limit => 60, :null => false
    t.string   "password_hash", :limit => 40, :null => false
    t.string   "password_salt", :limit => 20, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
