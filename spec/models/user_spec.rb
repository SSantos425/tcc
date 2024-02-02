require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(email: "admin@admin", password: "123456")
    expect(user).to be_valid
  end


  it "is not valid without an email" do
    user = User.new(password: "123456")
    expect(user).not_to be_valid
  end

  it "is not valid without a password" do
    user = User.new(email: "user@example.com")
    expect(user).not_to be_valid
  end
end
