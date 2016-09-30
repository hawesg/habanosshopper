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

ActiveRecord::Schema.define(version: 20160927084511) do

  create_table "boxcodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
    t.index ["package_id"], name: "index_boxcodes_on_package_id", using: :btree
  end

  create_table "coh_bcodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "bcode"
    t.integer  "coh_price_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "package_id"
    t.index ["coh_price_id"], name: "index_coh_bcodes_on_coh_price_id", using: :btree
    t.index ["package_id"], name: "index_coh_bcodes_on_package_id", using: :btree
  end

  create_table "coh_prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "price",      limit: 24
    t.integer  "package_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["package_id"], name: "index_coh_prices_on_package_id", using: :btree
  end

  create_table "ih_prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "price",      limit: 24
    t.integer  "package_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["package_id"], name: "index_ih_prices_on_package_id", using: :btree
  end

  create_table "package_maps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_package_maps_on_package_id", using: :btree
  end

  create_table "packages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "bsize"
    t.integer  "multiplier"
    t.string   "package_type"
    t.boolean  "tubo"
    t.integer  "vitola_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "bcount"
    t.index ["vitola_id"], name: "index_packages_on_vitola_id", using: :btree
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "package_id"
    t.integer  "price_cents",    default: 0, null: false
    t.string   "price_currency",             null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "type"
    t.index ["package_id"], name: "index_prices_on_package_id", using: :btree
  end

  create_table "stag_bcodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "stagID"
    t.string   "name"
    t.string   "bcode"
    t.integer  "stag_price_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "package_id"
    t.index ["package_id"], name: "index_stag_bcodes_on_package_id", using: :btree
    t.index ["stag_price_id"], name: "index_stag_bcodes_on_stag_price_id", using: :btree
  end

  create_table "stag_prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "price",      limit: 24
    t.string   "stagID"
    t.integer  "package_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["package_id"], name: "index_stag_prices_on_package_id", using: :btree
  end

  create_table "vitolas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "marca"
    t.string   "vitola"
    t.integer  "length"
    t.integer  "rg"
    t.string   "releaseType"
    t.integer  "year"
    t.string   "region"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "backup_id"
  end

  add_foreign_key "boxcodes", "packages"
  add_foreign_key "coh_bcodes", "coh_prices"
  add_foreign_key "coh_bcodes", "packages"
  add_foreign_key "coh_prices", "packages"
  add_foreign_key "ih_prices", "packages"
  add_foreign_key "package_maps", "packages"
  add_foreign_key "packages", "vitolas"
  add_foreign_key "prices", "packages"
  add_foreign_key "stag_bcodes", "packages"
  add_foreign_key "stag_bcodes", "stag_prices"
  add_foreign_key "stag_prices", "packages"
end
