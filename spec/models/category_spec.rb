require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    subject { build(:category) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:albums) }
  end

  describe '#image' do
    subject { create(:category, :with_image).image }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe '#artists' do
    let(:artist) { create(:artist) }
    let!(:category) { create(:category) }
    let!(:album) { create(:album, artist: artist) }

    it 'returns artist' do
      category.albums << album

      expect(category.artists).to eq([artist])
    end
  end

  describe '#songs' do
    let!(:category) { create(:category) }
    let!(:album) { create(:album) }
    let!(:song) { create(:song) }

    it 'returns song' do
      category.albums << album
      album.songs << song

      expect(category.songs).to eq([song])
    end
  end
end
