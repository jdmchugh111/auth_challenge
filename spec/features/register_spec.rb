require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit register_path

    username = "abby123"
    email = "abby@example.com"
    password = "123abby"
    password_confirmation = "123abby"

    fill_in :user_username, with: username
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password_confirmation

    click_on "Create New User"

    expect(current_path).to eq(user_path(User.find_by(username: username)))
    expect(page).to have_content("Welcome, #{username}!")
  end
end