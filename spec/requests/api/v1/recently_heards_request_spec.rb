require 'rails_helper'

RSpec.describe "Api::V1::RecentlyHeards", type: :request do
  let(:user) { create(:user) }

  before { sign_in(user) }
  
  describe 'POST #create' do
    let(:album) { create(:album) }

    subject { post api_v1_album_recently_heards_path(album) }

    it 'creates the recently_heard' do
      expect{ subject }.to change(RecentlyHeard, :count).by(1)
    end
  end
end
