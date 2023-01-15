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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_033119) do
  create_table "games", force: :cascade do |t|
    t.integer "started_by_id"
    t.string "started_by_visitor_id"
    t.string "state"
    t.string "code", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_games_on_code"
    t.index ["started_by_id"], name: "index_games_on_started_by_id"
    t.index ["started_by_visitor_id"], name: "index_games_on_started_by_visitor_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "user_id"
    t.string "visitor_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
    t.index ["visitor_id"], name: "index_players_on_visitor_id"
  end

  create_table "remember_me_tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_remember_me_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_remember_me_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "users", column: "started_by_id"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
  add_foreign_key "remember_me_tokens", "users"
end
