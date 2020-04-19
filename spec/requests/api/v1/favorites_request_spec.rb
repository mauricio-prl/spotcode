require 'rails_helper'

RSpec.describe Api::V1::FavoritesController, type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #index' do
    subject { get api_v1_favorites_path }

    it 'has http status ok' do
      subject

      expect(response).to have_http_status(:ok)
    end

    it 'calls current_user favorites' do
      allow(user.favorites).to receive(:where).with(favoritable_type: 'Album').and_return([])
      allow(user.favorites).to receive(:where).with(favoritable_type: 'Song').and_return([])
      allow(user.favorites).to receive(:where).with(favoritable_type: 'Artist').and_return([])

      expect(user.favorites).to receive(:where).with(favoritable_type: 'Album')
      expect(user.favorites).to receive(:where).with(favoritable_type: 'Song')
      expect(user.favorites).to receive(:where).with(favoritable_type: 'Artist')

      subject
    end
  end

  describe 'POST #create' do
    context 'when favoring an Album' do
      let(:album) { create(:album) }

      subject { post favorite_api_v1_album_path(album) }

      it 'has have_http_status created' do
        subject

        expect(response).to have_http_status(:created)
      end

      it 'creates the favorite' do
        expect{ subject }.to change(Favorite, :count).by(1)
      end
    end
    
    context 'when favoring a Song' do
      let(:song) { create(:song) }

      subject { post favorite_api_v1_song_path(song) }

      it 'has have_http_status created' do
        subject

        expect(response).to have_http_status(:created)
      end

      it 'creates the favorite' do
        expect{ subject }.to change(Favorite, :count).by(1)
      end
    end

    context 'when favoring an Artist' do
      let(:artist) { create(:artist) }

      subject { post favorite_api_v1_artist_path(artist) }

      it 'has have_http_status created' do
        subject

        expect(response).to have_http_status(:created)
      end

      it 'creates the favorite' do
        expect{ subject }.to change(Favorite, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when it does not delete the favorite' do
      let(:album) { create(:album) }

      subject { delete favorite_api_v1_album_path(album) }

      it 'has have_http_status created' do
        subject

        expect(response).to have_http_status(:ok)
      end

      it 'creates the favorite' do
        expect{ subject }.not_to change(Favorite, :count)
      end

      it 'has the message' do
        subject

        expect(response.body).to match(/It wasn\'t possible to find this favorite.../)
      end
    end

    context 'when disfavoring an Album' do
      let(:album) { create(:album) }
      let!(:favorite) { create(:favorite, user: user, favoritable: album) }

      subject { delete favorite_api_v1_album_path(album) }

      it 'has have_http_status created' do
        subject

        expect(response).to have_http_status(:ok)
      end

      it 'creates the favorite' do
        expect{ subject }.to change(Favorite, :count).by(-1)
      end
    end
    
    context 'when disfavoring a Song' do
      let(:song) { create(:song) }
      let!(:favorite) { create(:favorite, user: user, favoritable: song) }

      subject { post favorite_api_v1_song_path(song) }

      it 'has have_http_status created' do
        subject

        expect(response).to have_http_status(:created)
      end

      it 'creates the favorite' do
        expect{ subject }.to change(Favorite, :count).by(1)
      end
    end

    context 'when disfavoring an Artist' do
      let(:artist) { create(:artist) }
      let!(:favorite) { create(:favorite, user: user, favoritable: artist) }

      subject { post favorite_api_v1_artist_path(artist) }

      it 'has have_http_status created' do
        subject

        expect(response).to have_http_status(:created)
      end

      it 'creates the favorite' do
        expect{ subject }.to change(Favorite, :count).by(1)
      end
    end
  end
end
