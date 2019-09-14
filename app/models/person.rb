# frozen_string_literal: true

# app/models/person.rb
class Person < ApplicationRecord
  self.abstract_class = true

  def identifier
    full_name || email
  end
end
