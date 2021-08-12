# frozen_string_literal: true

class CreateCinemaHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :cinema_halls do |t|
      t.integer :name
      t.integer :size
      t.integer :collumn_num
      t.integer :row_num

      t.timestamps
    end
  end
end
