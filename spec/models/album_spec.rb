require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:artist) }
    it { is_expected.to have_many(:songs) }
    it { is_expected.to have_many(:recently_heards) }
  end

  describe '#cover' do
    subject { create(:album, :with_cover).cover }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end
end
