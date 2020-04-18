require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET /index' do
    it 'returns http ok' do
      get '/'

      expect(response).to have_http_status(:ok)
    end
  end
end
