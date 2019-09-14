# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_users
  has_many :users, through: :project_users

  has_many :companies

  validates :name, presence: true

  before_save :set_default

  def set_default
    self.domains = domains.map(&:downcase)
  end
end
