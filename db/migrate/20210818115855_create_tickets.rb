# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :ticket_type, null: false
      t.float :price, null: false
      t.references :screening, null: false
      t.references :seat, null: false
      t.references :reservation, null: false

      t.timestamps
    end
  end
end
