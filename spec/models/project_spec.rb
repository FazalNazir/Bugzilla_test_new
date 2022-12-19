# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:project) { create(:project) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(project).to be_valid
    end

    it 'is not valid without a title' do
      project.title = nil
      expect(project).not_to be_valid
    end

    it { is_expected.to validate_presence_of(:creator_id) }
    it { is_expected.to validate_presence_of(:tester_id) }
    it { is_expected.to validate_presence_of(:developer_id) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(20).with_message('20 characters is the maximum allowed') }
  end

  describe 'Associations' do
    it { is_expected.to respond_to(:creator) }
    it { is_expected.to respond_to(:developer) }
    it { is_expected.to respond_to(:tester) }
    it { is_expected.to have_many(:bugs) }
    it { is_expected.to have_many(:assignments) }
    it { is_expected.to have_many(:users).through(:assignments) }
  end
end
