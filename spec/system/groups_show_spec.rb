require 'rails_helper'

RSpec.describe 'Movement Index', type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'mike', email: 'mihael@gmail.com', password: '123456', password_confirmation: '123456', confirmed_at: Time.now)
    login_as(@user, scope: :user)
    @group = Group.create(name: 'Group 1', icon: 'icon.png', author: @user)
    driven_by(:rack_test)
  end

  it 'displays the add a new transaction button' do
    visit new_user_group_operation_path(user_id: @user.id, group_id: @group.id)
    expect(page).to have_content("Select")
  end

  it "displays the add a new group button" do
    visit user_group_path(user_id: @user.id, id: @group.id)
    expect(page).to have_content("Add new transaction")
  end

end
