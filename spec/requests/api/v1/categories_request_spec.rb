require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #index' do
    it 'has http status ok' do
      get '/api/v1/categories'

      expect(response).to have_http_status(:ok)
    end
  end
end
