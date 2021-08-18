# frozen_string_literal: true

class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.string :name, null: false
      t.references :cinema_hall, null: false

      t.timestamps
    end
  end
end
