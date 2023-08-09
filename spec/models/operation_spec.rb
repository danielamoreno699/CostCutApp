require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe "validations" do
    let(:user) { User.create(name: "John Doe", email: "john@example.com", password: "password", confirmed_at: Time.now) }

    it "validates presence of name" do
      operation = Operation.new(name: nil, author: user, amount: 100)
      expect(operation).not_to be_valid
      expect(operation.errors[:name]).to include("can't be blank")
    end

    it "validates presence of amount" do
      operation = Operation.new(name: "Expense", author: user, amount: nil)
      expect(operation).not_to be_valid
      expect(operation.errors[:amount]).to include("can't be blank")
    end

    it "validates amount to be greater than or equal to 0" do
      operation = Operation.new(name: "Income", author: user, amount: -50)
      expect(operation).not_to be_valid
      expect(operation.errors[:amount]).to include("must be greater than or equal to 0")
    end

    it "is valid with all required attributes" do
      operation = Operation.new(name: "Income", author: user, amount: 100)
      expect(operation).to be_valid
    end
  end
end
