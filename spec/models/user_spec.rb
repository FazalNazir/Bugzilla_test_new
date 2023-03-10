# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'requires the valid email' do
      user.email = Faker::Name.name
      expect(user).not_to be_valid
    end

    it 'requires the username' do
      user.name = ''
      expect(user).not_to be_valid
    end

    it { is_expected.to validate_length_of(:name).is_at_most(50).with_message('50 characters is the maximum allowed') }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:projects).through(:assignments).without_validating_presence }
    it { is_expected.to have_many(:assignments).without_validating_presence }
  end
end
