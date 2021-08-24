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

ActiveRecord::Schema.define(version: 2021_08_18_115855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinema_halls", force: :cascade do |t|
    t.integer "name", null: false
    t.integer "size", null: false
    t.integer "column_num"
    t.integer "row_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.interval "length"
    t.string "director"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "screenings", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "cinema_hall_id", null: false
    t.datetime "screen_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cinema_hall_id"], name: "index_screenings_on_cinema_hall_id"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "cinema_hall_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cinema_hall_id"], name: "index_seats_on_cinema_hall_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "ticket_type", null: false
    t.float "price", null: false
    t.bigint "screening_id", null: false
    t.bigint "seat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["screening_id"], name: "index_tickets_on_screening_id"
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
  end

end
