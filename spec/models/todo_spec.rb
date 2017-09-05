require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'when validating fields' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:created_by) }
  end

  context 'when validating associations' do
    it { is_expected.to have_many(:items).dependent(:destroy) }
  end
end
