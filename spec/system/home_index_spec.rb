require 'rails_helper'

RSpec.describe 'Homepage', type: :system do
  before do
    driven_by(:rack_test)
    visit root_path
  end

  it 'displays the app logo' do
    expect(page).to have_css('.logo')
    expect(page).to have_content('cost app food')
  end

  it 'displays sign up and sign in links' do
    expect(page).to have_link('Sign Up', href: new_user_registration_path)
    expect(page).to have_link('Sign In', href: new_user_session_path)
  end

  it 'redirects to sign up page when "Sign Up" link is clicked' do
    click_link 'Sign Up'
    expect(page).to have_current_path(new_user_registration_path)
  end

  it 'redirects to sign in page when "Sign In" link is clicked' do
    click_link 'Sign In'
    expect(page).to have_current_path(new_user_session_path)
  end
end
