require 'rails_helper'
require 'spec_helper'

describe "Registering as an admin"  do
  it "allows a user to register as an admin and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/users"
    expect(page).to have_content("Listing Admins")
    click_link "New User"

    fill_in "First name", with: "Ronin"
    fill_in "Last name", with: "Wood"
    fill_in "Email", with: "poop@dude.com"
    fill_in "Password", with: "Roninpoops"
    fill_in "Password confirmation", with: "Roninpoops"

    click_button "Save"

    expect(User.count).to eq(1)
  end
end