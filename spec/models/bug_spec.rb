require 'rails_helper'

RSpec.describe Bug, type: :model do
  let!(:bug) { FactoryBot.create(:bug) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(bug).to be_valid
    end

    it 'is not valid without a title' do
      bug.title = nil
      expect(bug).not_to be_valid
    end

    it { is_expected.to validate_length_of(:title).is_at_most(30).with_message('30 characters is the maximum allowed') }
  end

  describe 'Associations' do
    it { is_expected.to respond_to(:creator) }
    it { is_expected.to respond_to(:solver) }
    it { is_expected.to respond_to(:proj) }
    it { expect(bug.image).to be_attached }
  end
end
