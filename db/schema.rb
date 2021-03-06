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

ActiveRecord::Schema.define(version: 20170705084138) do

  create_table "documents", force: :cascade, options: "ENGINE=Mroonga DEFAULT CHARSET=utf8", comment: "engine \"InnoDB\"" do |t|
    t.text "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_documents_on_content", type: :fulltext, comment: "normalizer \"NormalizerMySQLUnicodeCIExceptKanaCIKanaWithVoicedSoundMark\""
    t.index ["title"], name: "index_documents_on_title", type: :fulltext, comment: "normalizer \"NormalizerMySQLUnicodeCIExceptKanaCIKanaWithVoicedSoundMark\""
  end

  create_table "microposts", force: :cascade, options: "ENGINE=Mroonga DEFAULT CHARSET=utf8", comment: "engine \"InnoDB\"" do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_microposts_on_content", type: :fulltext, comment: "normalizer \"NormalizerMySQLUnicodeCIExceptKanaCIKanaWithVoicedSoundMark\""
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
