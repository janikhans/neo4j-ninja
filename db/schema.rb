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

ActiveRecord::Schema.define(version: 20170114012605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fitments", force: :cascade do |t|
    t.integer  "part_id"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_fitments_on_part_id", using: :btree
    t.index ["vehicle_id"], name: "index_fitments_on_vehicle_id", using: :btree
  end

  create_table "parts", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "part_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_parts_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "vehicle_type_id"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["brand_id"], name: "index_vehicle_models_on_brand_id", using: :btree
    t.index ["vehicle_type_id"], name: "index_vehicle_models_on_vehicle_type_id", using: :btree
  end

  create_table "vehicle_submodels", force: :cascade do |t|
    t.integer  "vehicle_model_id"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["vehicle_model_id"], name: "index_vehicle_submodels_on_vehicle_model_id", using: :btree
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_years", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "vehicle_submodel_id"
    t.integer  "vehicle_year_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["vehicle_submodel_id"], name: "index_vehicles_on_vehicle_submodel_id", using: :btree
    t.index ["vehicle_year_id"], name: "index_vehicles_on_vehicle_year_id", using: :btree
  end

  add_foreign_key "fitments", "parts"
  add_foreign_key "fitments", "vehicles"
  add_foreign_key "parts", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "vehicle_models", "brands"
  add_foreign_key "vehicle_models", "vehicle_types"
  add_foreign_key "vehicle_submodels", "vehicle_models"
  add_foreign_key "vehicles", "vehicle_submodels"
  add_foreign_key "vehicles", "vehicle_years"
end
