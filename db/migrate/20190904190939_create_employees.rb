# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :emails, array: true, default: []
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
