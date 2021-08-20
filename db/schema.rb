# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_818_115_855) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cinema_halls', force: :cascade do |t|
    t.integer 'name'
    t.integer 'size'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title'
    t.integer 'length'
    t.string 'director'
    t.string 'genre'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'screenings', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'cinema_hall_id', null: false
    t.datetime 'screen_time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cinema_hall_id'], name: 'index_screenings_on_cinema_hall_id'
    t.index ['movie_id'], name: 'index_screenings_on_movie_id'
  end

  create_table 'seets', force: :cascade do |t|
    t.string 'name', null: false
    t.bigint 'cinema_hall_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cinema_hall_id'], name: 'index_seets_on_cinema_hall_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'type', null: false
    t.float 'price', null: false
    t.boolean 'available', default: true
    t.bigint 'seats_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['seats_id'], name: 'index_tickets_on_seats_id'
  end

  add_foreign_key 'screenings', 'cinema_halls'
  add_foreign_key 'screenings', 'movies'
end
