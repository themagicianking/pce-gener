# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_09_015442) do
  create_table "accents", force: :cascade do |t|
    t.string "name"
    t.string "allele_1"
    t.string "allele_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cats", force: :cascade do |t|
    t.string "species"
    t.string "wind"
    t.string "fur"
    t.string "color"
    t.string "pattern"
    t.string "white_marks"
    t.boolean "adult"
    t.integer "genome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "o_and_b_allele_1"
    t.string "o_and_b_allele_2"
    t.string "dilute_allele_1"
    t.string "dilute_allele_2"
    t.string "density_allele"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furs", force: :cascade do |t|
    t.string "name"
    t.string "allele_1"
    t.string "allele_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genomes", force: :cascade do |t|
    t.string "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "growths", force: :cascade do |t|
    t.string "allele_1"
    t.string "allele_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name"
    t.string "visible_allele_1"
    t.string "visible_allele_2"
    t.string "type_allele_1"
    t.string "type_allele_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "allele_1"
    t.string "allele_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "whites", force: :cascade do |t|
    t.string "name"
    t.string "visible_allele_1"
    t.string "visible_allele_2"
    t.string "level_allele"
    t.string "type_allele"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "winds", force: :cascade do |t|
    t.string "name"
    t.string "allele_1"
    t.string "allele_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
