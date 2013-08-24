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

ActiveRecord::Schema.define(:version => 20130824013147) do

  create_table "books", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.integer  "volume"
    t.boolean  "adult"
    t.text     "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "stock"
    t.string   "subtitle"
    t.boolean  "oversized"
    t.boolean  "non_standard_size"
    t.string   "category"
    t.string   "publisher"
    t.string   "author"
    t.string   "language"
  end

  create_table "checkouts", :force => true do |t|
    t.integer  "book_id"
    t.integer  "patron_id"
    t.string   "status"
    t.datetime "closed_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patrons", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "gender"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
