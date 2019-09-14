# frozen_string_literal: true

# spec/models/account_spec.rb
require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:p) do
    FactoryBot.create(:project)
  end

  describe 'smart defaults' do
    it 'should have lowercase domains' do
      expect(p.domains[0]).to eq 'e-virdis.it'
    end
  end
end
