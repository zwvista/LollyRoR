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

ActiveRecord::Schema.define(version: 0) do

  create_table "AUTOCORRECT", primary_key: "ID", force: :cascade do |t|
    t.integer "LANGID",               null: false
    t.integer "ORD",      default: 0, null: false
    t.text    "INPUT",                null: false
    t.text    "EXTENDED",             null: false
    t.text    "BASIC",                null: false
  end

  create_table "BOOKS", primary_key: "BOOKID", force: :cascade do |t|
    t.integer "LANGID",      default: 0,      null: false
    t.text    "BOOKNAME",                     null: false
    t.integer "UNITSINBOOK", default: 0,      null: false
    t.text    "PARTS",       default: "Text", null: false
    t.integer "UNITFROM",    default: 1,      null: false
    t.integer "PARTFROM",    default: 1,      null: false
    t.integer "UNITTO",      default: 1,      null: false
    t.integer "PARTTO",      default: 1,      null: false
  end

  create_table "DICTALL", id: false, force: :cascade do |t|
    t.integer "LANGID"
    t.integer "ORD"
    t.integer "LANGIDTO"
    t.text    "DICTTYPENAME"
    t.text    "DICTNAME"
    t.text    "URL"
    t.text    "CHCONV"
    t.text    "AUTOMATION"
    t.integer "AUTOJUMP"
    t.text    "DICTTABLE"
    t.text    "TRANSFORM_WIN"
    t.text    "TRANSFORM_MAC"
    t.integer "WAIT"
    t.text    "TEMPLATE"
  end

  create_table "DICTIONARIES", id: false, force: :cascade do |t|
    t.integer "LANGID",     default: 1,       null: false
    t.integer "ORD",                          null: false
    t.integer "DICTTYPEID", default: 3,       null: false
    t.text    "DICTNAME",                     null: false
    t.integer "LANGIDTO",   default: 1,       null: false
    t.text    "URL"
    t.text    "CHCONV",     default: "UTF-8"
    t.text    "AUTOMATION"
    t.integer "AUTOJUMP",   default: 0,       null: false
    t.text    "DICTTABLE"
    t.text    "TEMPLATE"
  end

  add_index "DICTIONARIES", ["LANGID", "DICTNAME"], name: "sqlite_autoindex_DICTIONARIES_1", unique: true

  create_table "DICTTYPES", primary_key: "DICTTYPEID", force: :cascade do |t|
    t.text "DICTTYPENAME", null: false
  end

  create_table "LANGUAGES", primary_key: "LANGID", force: :cascade do |t|
    t.text    "LANGNAME",              null: false
    t.text    "CHNNAME",               null: false
    t.text    "VOICE"
    t.integer "CURBOOKID", default: 0
    t.text    "ENGNAME"
  end

  create_table "PHRASES", primary_key: "ID", force: :cascade do |t|
    t.integer "BOOKID",      default: 0, null: false
    t.integer "UNIT",        default: 0, null: false
    t.integer "PART",        default: 0, null: false
    t.integer "ORD",         default: 0, null: false
    t.text    "PHRASE",                  null: false
    t.text    "TRANSLATION"
  end

  create_table "PICBOOKS", primary_key: "BOOKNAME", force: :cascade do |t|
    t.integer "LANGID",   default: 0, null: false
    t.text    "FILENAME",             null: false
    t.integer "NUMPAGES", default: 1, null: false
    t.integer "CURPAGE",  default: 1, null: false
  end

  add_index "PICBOOKS", ["BOOKNAME"], name: "sqlite_autoindex_PICBOOKS_1", unique: true

  create_table "WEBEXTRACT", primary_key: "SITENAME", force: :cascade do |t|
    t.text    "TRANSFORM_WIN"
    t.text    "TRANSFORM_MAC"
    t.integer "WAIT",          default: 50
  end

  add_index "WEBEXTRACT", ["SITENAME"], name: "sqlite_autoindex_WEBEXTRACT_1", unique: true

  create_table "WEBTEXT", primary_key: "SITENAME", force: :cascade do |t|
    t.text "URL"
    t.text "TEMPLATE"
    t.text "FOLDER"
  end

  add_index "WEBTEXT", ["SITENAME"], name: "sqlite_autoindex_WEBTEXT_1", unique: true

  create_table "WEBTEXTALL", id: false, force: :cascade do |t|
    t.text    "SITENAME"
    t.text    "TRANSFORM_WIN"
    t.text    "TRANSFORM_MAC"
    t.text    "TEMPLATE"
    t.text    "URL"
    t.text    "FOLDER"
    t.integer "WAIT"
  end

  create_table "WORDSBOOK", primary_key: "ID", force: :cascade do |t|
    t.integer "BOOKID",             null: false
    t.integer "UNIT",   default: 0, null: false
    t.integer "PART",   default: 0, null: false
    t.integer "ORD",    default: 0, null: false
    t.text    "WORD",               null: false
    t.text    "NOTE"
  end

  create_table "WORDSLANG", id: false, force: :cascade do |t|
    t.integer "LANGID",             null: false
    t.text    "WORD",               null: false
    t.integer "LEVEL",  default: 0, null: false
  end

  add_index "WORDSLANG", ["LANGID", "WORD"], name: "sqlite_autoindex_WORDSLANG_1", unique: true

  create_table "sysdiagrams", primary_key: "diagram_id", force: :cascade do |t|
    t.text    "name",         null: false
    t.integer "principal_id", null: false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["principal_id", "name"], name: "sqlite_autoindex_sysdiagrams_1", unique: true

end
