# frozen_string_literal: true

class CreateSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :sheets do |t|
      t.string :title, null: false
      t.string :description
      t.integer :goal, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :jar_id
      t.string :jar_url
      t.string :status, default: 'opened'

      t.timestamps
    end
  end
end
