require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_numericality_of(:played_count).is_greater_than_or_equal_to(0) }
  end

  describe '#file' do
    subject { create(:song).file }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end
end
