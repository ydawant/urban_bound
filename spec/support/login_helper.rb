require 'capybara/rails'

module LoginHelpers

  def user_login(user)
    visit root_path

    fill_in 'email',    with: user.email
    fill_in 'password', with: "Password1"
    click_button "Sign In"
  end
end
