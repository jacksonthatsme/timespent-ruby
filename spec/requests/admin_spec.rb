require 'rails_helper'
require 'spec_helper'

describe "Admin Login" do

  it "accesses the dashboard" do 
    User.create(first_name: "Ronin", last_name: "Wood", email: "timespentwith@gmail.com", password: "poopdood", password_confirmation: "poopdood")
    visit new_user_session_path
    fill_in "Email Address", with: "timespentwith@gmail.com"
    fill_in "Password", with: "poopdood"
    click_button "Log In"

    expect(page).to have_content("Admin Panel")

  end
end