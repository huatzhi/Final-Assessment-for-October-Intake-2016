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

  it 'cannot be created with invalid email' do
    @user.email = 'abc123'
    expect(@user).to_not be_valid
  end

  it 'cannot repeat the used email' do 
    @userB = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", username: "test")
    expect(@userB).to_not be_valid
  end
end
