# frozen_string_literal: true

class CreateCinemaHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :cinema_halls do |t|
      t.integer :name, null: false
      t.integer :size, null: false
      t.integer :column_num
      t.integer :row_num

      t.timestamps
    end
  end
end
