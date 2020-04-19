require 'rails_helper'

RSpec.describe RecentAlbumsFinder, type: :service do
  let(:user) { create(:user) }
  let!(:recently_heards) { create(:recently_heard, user: user, created_at: Time.current) }
  let!(:recently_heards1) { create(:recently_heard, user: user, created_at: Time.current - 5.days) }
  let!(:recently_heards2) { create(:recently_heard, user: user, created_at: Time.current - 10.days) }
  let!(:recently_heards3) { create(:recently_heard, user: user, created_at: Time.current - 15.days) }
  let!(:recently_heards4) { create(:recently_heard, user: user, created_at: Time.current - 20.days) }

  describe '.call' do
    it 'returns nil unless user' do
      expect(described_class.call(nil)).to eq(nil)
    end

    it 'returns the last albums heard by user, ordering by created_at desc, and limit 4' do
      expect(described_class.call(user)).to eq([
        recently_heards.album, recently_heards1.album, recently_heards2.album, recently_heards3.album
      ])
    end
  end
end
