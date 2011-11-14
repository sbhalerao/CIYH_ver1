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

ActiveRecord::Schema.define(:version => 20111114160712) do

  create_table "catwalks", :force => true do |t|
    t.string   "catname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "catpic_file_name"
    t.string   "catpic_content_type"
    t.integer  "catpic_file_size"
    t.datetime "catpic_updated_at"
    t.integer  "user_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avtar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "message"
    t.float    "cat1x",               :default => 100.0
    t.float    "cat1y",               :default => 100.0
    t.float    "cat1h",               :default => 100.0
    t.float    "cat1w",               :default => 60.0
    t.float    "cat2x",               :default => 100.0
    t.float    "cat2y",               :default => 100.0
    t.float    "cat2h",               :default => 115.0
    t.float    "cat2w",               :default => 84.0
    t.float    "cat3x",               :default => 100.0
    t.float    "cat3y",               :default => 100.0
    t.float    "cat3h",               :default => 100.0
    t.float    "cat3w",               :default => 77.0
    t.float    "hat1x",               :default => 100.0
    t.float    "hat1y",               :default => 100.0
    t.float    "hat1h",               :default => 42.0
    t.float    "hat1w",               :default => 60.0
    t.float    "hat2x",               :default => 100.0
    t.float    "hat2y",               :default => 100.0
    t.float    "hat2h",               :default => 58.0
    t.float    "hat2w",               :default => 75.0
    t.float    "hat3x",               :default => 100.0
    t.float    "hat3y",               :default => 100.0
    t.float    "hat3h",               :default => 87.0
    t.float    "hat3w",               :default => 75.0
    t.integer  "user_id"
    t.integer  "cat1move",            :default => 0
    t.integer  "cat2move",            :default => 0
    t.integer  "cat3move",            :default => 0
    t.integer  "hat1move",            :default => 0
    t.integer  "hat2move",            :default => 0
    t.integer  "hat3move",            :default => 0
    t.float    "cat4x",               :default => 100.0
    t.float    "cat4y",               :default => 100.0
    t.float    "cat4h",               :default => 90.0
    t.float    "cat4w",               :default => 106.0
    t.float    "cat5x",               :default => 100.0
    t.float    "cat5y",               :default => 100.0
    t.float    "cat5h",               :default => 120.0
    t.float    "cat5w",               :default => 106.0
    t.float    "cat6x",               :default => 100.0
    t.float    "cat6y",               :default => 100.0
    t.float    "cat6h",               :default => 104.0
    t.float    "cat6w",               :default => 120.0
    t.float    "hat4x",               :default => 100.0
    t.float    "hat4y",               :default => 100.0
    t.float    "hat4h",               :default => 76.0
    t.float    "hat4w",               :default => 70.0
    t.float    "hat5x",               :default => 100.0
    t.float    "hat5y",               :default => 100.0
    t.float    "hat5h",               :default => 42.0
    t.float    "hat5w",               :default => 75.0
    t.float    "hat6x",               :default => 100.0
    t.float    "hat6y",               :default => 100.0
    t.float    "hat6h",               :default => 53.0
    t.float    "hat6w",               :default => 70.0
    t.integer  "cat4move",            :default => 0
    t.integer  "cat5move",            :default => 0
    t.integer  "cat6move",            :default => 0
    t.integer  "hat4move",            :default => 0
    t.integer  "hat5move",            :default => 0
    t.integer  "hat6move",            :default => 0
    t.float    "backx"
    t.float    "backy"
    t.string   "backimg",             :default => "/Users/sbhalerao/rails_projects/blog/public/images/catsback.png"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "token"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "fk_voteables"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "uniq_one_vote_only", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "fk_voters"

end
