require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "validations" do
    it "validates presence of name" do
      group = Group.new(name: nil, author: User.new, icon: "icon.png")
      expect(group).not_to be_valid
    end

    it "validates presence of icon" do
      group = Group.new(name: "Test Group", author: User.new, icon: nil)
      expect(group).not_to be_valid
    end
  end
end
