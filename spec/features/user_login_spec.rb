# spec/features/user_login_spec.rb

require 'rails_helper'

RSpec.feature "User Login", type: :feature do
  scenario "User logs in with valid credentials" do
    visit new_user_session_path

    fill_in "Email", with: "admin@admin"
    fill_in "Password", with: "123456"

    click_button "Log in"

    expect(page).to have_current_path(root_path)
  end

  scenario "User cannot log in with invalid credentials" do
    visit new_user_session_path

    fill_in "Email", with: "invalid_email@example.com"
    fill_in "Password", with: "invalid_password"

    click_button "Log in"

    expect(page).to have_content "Invalid Email or password."
  end
end
