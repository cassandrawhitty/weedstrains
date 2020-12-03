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

ActiveRecord::Schema.define(version: 2020_12_03_211502) do

  create_table "effects", force: :cascade do |t|
    t.string "effect"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "joiners", force: :cascade do |t|
    t.integer "effect_id", null: false
    t.integer "strain_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["effect_id"], name: "index_joiners_on_effect_id"
    t.index ["strain_id"], name: "index_joiners_on_strain_id"
  end

  create_table "strains", force: :cascade do |t|
    t.string "race"
    t.string "flavor"
    t.string "effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "joiners", "effects"
  add_foreign_key "joiners", "strains"
end
