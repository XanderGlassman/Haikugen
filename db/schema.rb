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

ActiveRecord::Schema.define(version: 20140716160558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "author"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poems", force: true do |t|
    t.string   "poem_type"
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sen_words", force: true do |t|
    t.integer  "word_id"
    t.integer  "sentence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sentences", force: true do |t|
    t.integer  "book_id"
    t.text     "body"
    t.string   "match_word"
    t.string   "end_word"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string   "body"
    t.integer  "syllable_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
