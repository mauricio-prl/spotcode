require 'rails_helper'

RSpec.describe Api::V1::DashboardController, type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    subject { get '/api/v1/dashboard' }

    it 'has http status ok' do
      subject

      expect(response).to have_http_status(:ok)
    end

    it 'calls #load_recent_heard' do
      allow_any_instance_of(described_class).to receive(:load_recent_heard)
      expect_any_instance_of(described_class).to receive(:load_recent_heard)

      subject
    end

    it 'calls #load_recommendations' do
      allow_any_instance_of(described_class).to receive(:load_recommendations)
      expect_any_instance_of(described_class).to receive(:load_recommendations)

      subject
    end
  end

  describe '#load_recent_heard' do
    subject { get '/api/v1/dashboard' }

    it 'calls RecentAlbumsFinder' do
      allow(RecentAlbumsFinder).to receive(:call).with(user)
      expect(RecentAlbumsFinder).to receive(:call).with(user)

      subject
    end
  end

  describe '#load_recommendations' do
    let(:category) { create(:category) }

    subject { get '/api/v1/dashboard' }

    it 'calls RecentAlbumsFinder' do
      allow(RecommendationsLoader).to receive(:call)
      expect(RecommendationsLoader).to receive(:call)

      subject
    end
  end
end
