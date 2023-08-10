require 'rails_helper'

RSpec.describe 'Navbar', type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'mike', email: 'mihael@gmail.com', password: '123456', confirmed_at: Time.now)
    login_as(@user, scope: :user)
    @group = Group.create(name: 'Group 1', icon: 'icon.png', author: @user)
    driven_by(:rack_test)
  end


  it 'displays logo-app' do
    visit user_groups_path(user_id: @user.id)
    expect(page).to have_css('.logo-app')
  end

  it 'displays img-log' do
    visit user_groups_path(user_id: @user.id)
    expect(page).to have_css('.img-log')
  end

  it 'displays user-email' do
    visit user_groups_path(user_id: @user.id)
    expect(page).to have_css('.user-email')
  end

  it 'displays nav' do
    visit user_groups_path(user_id: @user.id)
    expect(page).to have_css('.nav')
  end

  it 'displays sign_out-id' do
    visit user_groups_path(user_id: @user.id)
    expect(page).to have_css('#sign_out-id')
  end
end
