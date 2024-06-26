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

ActiveRecord::Schema.define(version: 2024_04_12_001942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemon_template_moves", force: :cascade do |t|
    t.bigint "pokemon_template_id", null: false
    t.bigint "move_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["move_id"], name: "index_pokemon_template_moves_on_move_id"
    t.index ["pokemon_template_id"], name: "index_pokemon_template_moves_on_pokemon_template_id"
  end

  create_table "pokemon_templates", force: :cascade do |t|
    t.string "name"
    t.string "types", default: [], array: true
    t.integer "hp"
    t.integer "atk"
    t.integer "def"
    t.integer "sp_atk"
    t.integer "sp_def"
    t.integer "spd"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.bigint "pokemon_template_id", null: false
    t.bigint "team_id", null: false
    t.string "nickname"
    t.string "nature"
    t.string "gender"
    t.float "weight"
    t.integer "evs", default: [], array: true
    t.integer "ivs", default: [], array: true
    t.string "moves", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_template_id"], name: "index_pokemons_on_pokemon_template_id"
    t.index ["team_id"], name: "index_pokemons_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pokemon_template_moves", "moves"
  add_foreign_key "pokemon_template_moves", "pokemon_templates"
  add_foreign_key "pokemons", "pokemon_templates"
  add_foreign_key "pokemons", "teams"
end
