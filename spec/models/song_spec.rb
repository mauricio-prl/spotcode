require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'validations' do
    subject { build(:song) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_numericality_of(:played_count).is_greater_than_or_equal_to(0) }
  end
end
