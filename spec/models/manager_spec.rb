# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:projects) }
  end
end
