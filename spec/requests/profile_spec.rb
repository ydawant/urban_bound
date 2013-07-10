require 'spec_helper'

describe 'Profile Page' do

  context "with a user not logged in" do
    let(:user)  { FactoryGirl.create(:user) }

    it "should only display when a user is logged in" do
      visit user_path(user)
      page.should have_content('Create Account')
    end

  end

  context "with a user logged in" do
    include LoginHelpers

    before do
      @user  = FactoryGirl.create(:user)

      user_login(@user)
      visit user_path(@user)
    end

    it "should display the user's first name" do
      page.should have_content(@user.first_name)
    end

    it "should allow to add a new book to your list of favorites" do
      page.should have_content "Add a book to your list of favorites:"
    end

    it "should add book to list of favorites" do
      book = FactoryGirl.create(:book)

      fill_in 'title',    with: book.title
      fill_in 'author', with: book.author
      fill_in 'rating', with: '4'
      click_button "Add Book"

      page.should have_content "First Book - John Doe (4) Remove"
    end

    it "should be able to remove a book from list of favorites" do
     book = FactoryGirl.create(:book)

     fill_in 'title',    with: book.title
     fill_in 'author', with: book.author
     fill_in 'rating', with: '4'
     click_button "Add Book"
     click_link "Remove"

     page.should_not have_content "First Book - John Doe (4) Remove"
   end
  end
end