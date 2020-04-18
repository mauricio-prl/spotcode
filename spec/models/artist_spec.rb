require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    subject { build(:artist) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:albums) }
  end

  describe '#photo' do
    subject { create(:artist, :with_photo).photo }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end
end
