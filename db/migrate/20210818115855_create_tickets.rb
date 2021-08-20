# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :type, null: false
      t.float :price, null: false
      t.references :screenings, null: false
      t.references :seats, null: false

      t.timestamps
    end
  end
end
