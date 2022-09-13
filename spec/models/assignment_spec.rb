# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  let(:assignment) { create :assignment }

  describe 'Associations' do
    it { is_expected.to respond_to(:project) }
    it { is_expected.to respond_to(:user) }
  end
end
