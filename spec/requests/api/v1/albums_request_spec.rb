require 'rails_helper'

RSpec.describe "Api::V1::Albums", type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #index' do
    let(:album) { create(:album, :with_cover) }

    it 'has http status ok' do
      get api_v1_album_path(album)

      expect(response).to have_http_status(:ok)
    end
  end
end
