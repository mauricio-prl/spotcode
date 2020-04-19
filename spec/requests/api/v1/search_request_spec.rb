require 'rails_helper'

RSpec.describe Api::V1::SearchController, type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #index' do
    subject { get api_v1_search_index_path }

    it 'has http status ok' do
      subject

      expect(response).to have_http_status(:ok)
    end

    it 'calls Song.where' do
      allow(Song).to receive(:where)
      allow(Album).to receive(:where)
      allow(Artist).to receive(:where)

      expect(Song).to receive(:where)
      expect(Album).to receive(:where)
      expect(Artist).to receive(:where)

      subject
    end
  end
end
