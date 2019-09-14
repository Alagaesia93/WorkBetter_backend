# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :project
  has_many :employees

  validates :name, uniqueness: { scope: :project }
end
