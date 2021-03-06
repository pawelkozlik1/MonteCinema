# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :status, null: false, default: 'pending'
      t.references :screening, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
