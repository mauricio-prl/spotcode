require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #index' do
    it 'has http status ok' do
      get api_v1_categories_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let!(:category) { create(:category, :with_image) }

    it 'has http status ok' do
      get api_v1_category_path(category)

      expect(response).to have_http_status(:ok)
    end
  end
end
