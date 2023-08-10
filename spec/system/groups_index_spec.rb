require 'rails_helper'

RSpec.describe "Groups", type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'mike', email: 'mihael@gmail.com', password: '123456', confirmed_at: Time.now)
    login_as(@user, scope: :user)
    @group = Group.create(name: 'Group 1', icon: 'icon.png', author: @user)
    driven_by(:rack_test)
  end

  describe 'GET index' do
    it 'displays "No groups yet" message' do
      visit user_groups_path(user_id: @user.id)

      expect(page).to have_css('.group')
    end

    it 'displays "Add new group" link' do
  
      visit user_groups_path(user_id: @user.id)
      expect(page).to have_text('Add new group')
    end

    it 'displays class amount ' do
      visit user_groups_path(user_id: @user.id)
      expect(page).to have_css('.amount')
    end


  end
end
