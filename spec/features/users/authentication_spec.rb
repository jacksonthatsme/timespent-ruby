require 'rails_helper'

describe "Logging In" do

  it "Logs the user in and goes to the home page" do
    User.create(first_name: "Ronin", last_name: "Wood", email: "timespentwith@gmail.com", password: "poopdood", password_confirmation: "poopdood")
    visit new_user_session_path
    fill_in "Email Address", with: "timespentwith@gmail.com"
    fill_in "Password", with: "poopdood"
    click_button "Log In"

    expect(page).to have_content("Timespent")
  end

  it "displays the email address in the event of a failed log in" do
    visit new_user_session_path
    fill_in "Email Address", with: "timespentwith@gmail.com"
    fill_in "Password", with: "wrong"
    click_button "Log In"

    expect(page).to have_field("Email Address", with: "timespentwith@gmail.com")
  end
end