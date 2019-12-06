# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_06_152250) do

  create_table "bottles", force: :cascade do |t|
    t.string "brand"
    t.string "wine_type"
    t.string "color"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cellars", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cellars_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "bottle_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bottle_id"], name: "index_reviews_on_bottle_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stashes", force: :cascade do |t|
    t.integer "bottle_id", null: false
    t.integer "cellar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bottle_id"], name: "index_stashes_on_bottle_id"
    t.index ["cellar_id"], name: "index_stashes_on_cellar_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "hint"
  end

  add_foreign_key "cellars", "users"
  add_foreign_key "reviews", "bottles"
  add_foreign_key "reviews", "users"
  add_foreign_key "stashes", "bottles"
  add_foreign_key "stashes", "cellars"
end
