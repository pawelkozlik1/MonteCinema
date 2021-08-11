# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.interval :length
      t.string :director
      t.string :genre

      t.timestamps
    end
  end
end
