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

ActiveRecord::Schema.define(version: 2018_09_27_211409) do

  create_table "addresses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.string "city", limit: 100
    t.string "state", limit: 100
    t.index ["user_id"], name: "user_fk"
  end

  create_table "cards", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.string "holder_name", limit: 250
    t.string "number", limit: 100
    t.date "expired_date"
    t.index ["user_id"], name: "userid_fk"
  end

  create_table "carts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "total_price"
  end

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 250
    t.integer "parent"
  end

  create_table "orders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shipping_id", null: false
    t.integer "seller_id", null: false
    t.integer "total_amount"
    t.integer "total_price"
    t.string "status", limit: 10
    t.index ["user_id"], name: "PRODUCT_SELLER"
  end

  create_table "product_orders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "price"
    t.integer "qty"
  end

  create_table "products", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "seller_id", null: false
    t.integer "category_id", null: false
    t.string "picture"
    t.string "name", null: false
    t.text "description"
    t.integer "stock", default: 1
    t.integer "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "attachment_data"
  end

  create_table "reviews", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.string "review"
    t.float "rating"
    t.datetime "created_at"
    t.index ["product_id"], name: "REVIEW_PRODUCT"
    t.index ["user_id"], name: "REVIEW_USER"
  end

  create_table "shippings", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "price"
  end

  create_table "user_carts", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "qty", default: 1, null: false
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "username", limit: 150, null: false
    t.string "email", limit: 100, null: false
    t.date "birthdate", null: false
    t.string "password_digest", null: false
    t.datetime "created_at"
    t.index ["username"], name: "USERNAME_INDEX", type: :fulltext
  end

  add_foreign_key "addresses", "users", name: "user_fk"
  add_foreign_key "cards", "users", name: "userid_fk"
  add_foreign_key "orders", "users", name: "PRODUCT_SELLER"
  add_foreign_key "orders", "users", name: "PRODUCT_USER"
  add_foreign_key "reviews", "products", name: "REVIEW_PRODUCT"
  add_foreign_key "reviews", "users", name: "REVIEW_USER"
end
