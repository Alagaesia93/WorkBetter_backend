# frozen_string_literal: true

class CreateOurMails < ActiveRecord::Migration[5.2]
  def change
    create_table :our_mails do |t|
      t.string :message_id
      t.string :from, array: true, default: []
      t.string :to, array: true, default: []
      t.string :cc, array: true, default: []
      t.string :bcc, array: true, default: []
      t.string :subject
      t.text :body
      t.jsonb :headers, default: {}
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
