# frozen_string_literal: true

class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :user, foreign_key: true
      t.integer :movie_id
      t.date :date
      t.time :time
      t.string :img_url
      t.string :movie_title
      t.integer :runtime

      t.timestamps
    end
  end
end
