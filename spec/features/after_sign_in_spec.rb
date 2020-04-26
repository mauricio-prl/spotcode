require 'rails_helper'

RSpec.describe 'After sign in redirect to discovery', type: :feature do
  let(:user) { create(:user) }

  it 'redirects to discovery' do
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path('/discovery')
  end
end
