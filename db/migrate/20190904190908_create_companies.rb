# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :url
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
