require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", username: "test")
  end

  it "can be created" do
    expect(@user).to be_valid
  end

  it "cannot be created without user" do
    @user.username = nil
    expect(@user).to_not be_valid
  end
end
