require 'spec_helper'
include LoginHelpers

describe 'User' do

  context "signup" do
    before(:each) do
      visit root_path
    end
    
    it "should log in user upon successful signup" do
      user = FactoryGirl.build(:user)
      expect {
        fill_in 'user_first_name', with: user.first_name
        fill_in 'user_last_name',  with: user.last_name
        fill_in 'user_email',      with: user.email
        fill_in 'user_password',   with: user.password
        click_button "Create Account"
      }.to change(User, :count).by(1)

      page.should have_content "Welcome John"
    end
    
    it "should display errors on unsuccessful signup" do
      click_button "Create Account"

      page.should have_content "Unsuccessful login. Please try again."
    end
  end

  context "sign up" do
    before(:each) do
      visit root_path
    end

    it "should log in a user with proper credentials" do
      user = FactoryGirl.create(:user)

      fill_in 'email',    with: user.email
      fill_in 'password', with: user.password
      click_button "Sign In"

      page.should have_content 'Welcome John'
    end

    it "displays errors on unsuccessful login" do
      click_button "Sign In"

      page.should have_content "Unsuccessful login. Please try again."
    end
  end

  context "log out" do
    it "should redirect to root page" do
      user = FactoryGirl.create(:user)
      user_login(user)
      click_link "Sign Out"

      page.should have_content 'join'
      page.should_not have_content user.first_name
    end
  end

  context "while logged out" do
    it "should not be able to access any other page" do
      user = FactoryGirl.create(:user)

      visit user_path(user)
      page.should have_content 'Create Account'
      page.should_not have_content "Welcome John"
    end
  end
end