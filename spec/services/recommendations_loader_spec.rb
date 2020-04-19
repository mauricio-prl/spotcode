require 'rails_helper'

RSpec.describe RecommendationsLoader, type: :service do
  let!(:albums) { create_list(:album, 12) }
  let(:rock) { create(:category) }

  describe '.call' do
    it 'returns Album.all.sample(12) when heard_categories = []' do
      allow(Album).to receive_message_chain(:all, :sample).and_return(albums)
      expect(Album).to receive_message_chain(:all, :sample).and_return(albums)

      described_class.call([])
    end

    it 'returns the last 12 heard albuns' do
      allow(Album).to receive_message_chain(:includes, :where, :order, :limit).and_return(albums)
      expect(Album).to receive_message_chain(:includes, :where, :order, :limit).and_return(albums)

      described_class.call([rock])
    end
  end
end
