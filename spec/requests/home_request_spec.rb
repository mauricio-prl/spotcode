require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET /index' do
    context 'when not logged' do
      it 'returns http 302' do
        get '/'

        expect(response).to have_http_status(302)
      end
    end

    context 'when logged in' do
      let(:user) { create(:user) }

      it 'returns http ok' do
        sign_in(user)
        get '/'

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
