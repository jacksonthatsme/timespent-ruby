require 'rails_helper'
require 'spec_helper'

describe 'Deleting shoots'  do
  let!(:shoot){Shoot.create(artist: "NYC SPELL", description: "This is the description", location: "Brooklyn,NY")}

  it "is sucessful when clicking destroy link" do
    visit '/shoots'

    within "#shoot_#{shoot.id}" do
      click_link "show"
    end

    click_link "delete"

    expect(page).to_not have_content(shoot.artist)
    expect(Shoot.count).to eq(0)
  end
end