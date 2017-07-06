require 'rails_helper'

feature "Sessions" do

  scenario "user can navigate to sign up page" do
    visit root_path
    click_link "Sign up"
    expect(page).to have_content("Sign up")
    expect(page).to have_content("(6 characters minimum)")
  end

  scenario "user can create a new account" do
    user = build(:user)
    visit new_user_registration_path
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "displays an error if the email is already taken" do
    user = create(:user)
    visit new_user_registration_path
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content("Email has already been taken")
  end

  scenario "displays an error if an email is used as username" do
    user = create(:user)
    visit new_user_registration_path
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content("Email has already been taken")
  end

end
