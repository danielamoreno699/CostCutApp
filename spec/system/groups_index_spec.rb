require 'rails_helper'

RSpec.describe "Groups", type: :system do
  let(:user_attributes) { { name: 'user B', email: 'test@gmail.com', password: '12345' } }
  let(:user) { User.create(user_attributes) }
  let(:group) { Group.create(name: 'Test Group', icon: 'test_icon.png') }

  before do
    driven_by(:rack_test)
    user.confirm
  end

  describe 'GET index' do
    it 'displays "No groups yet" message' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      # Simulate navigating to the index page
      visit user_groups_path(user_id: user.id)

      # Expectations
      expect(page).to have_text('There are no groups yet.')
    end

    it 'displays "Add new group" link' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      # Simulate navigating to the index page
      visit user_groups_path(user_id: user.id)

      # Expectations
      expect(page).to have_text('Add new group')
    end

  end
end
