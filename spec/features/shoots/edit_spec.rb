require 'rails_helper'
require 'spec_helper'

describe 'Editing shoots'  do

  let!(:shoot){Shoot.create(artist: "NYC SPELL", description: "This is the description", location: "Brooklyn,NY")}

  def update_shoot(options={})

    options[:artist] ||= "New artist"
    options[:description] ||= "New description"
    options[:location] ||= "New location"

    shoot = options[:shoot]

    visit '/shoots'

    within "#shoot_#{shoot.id}" do
      click_link "edit"
    end

    fill_in "shoot[artist]", with: options[:artist]
    fill_in "shoot[description]", with: options[:description]
    fill_in "shoot[location]", with: options[:location]

    click_button "Update Shoot"
  end
  
  it "updates a shoot succesfully with correct information" do

    update_shoot shoot: shoot,
                  artist: "New artist",
                  description: "New description",
                  location: "New location"

    shoot.reload

    expect(shoot.artist).to eq("New artist")
    expect(shoot.description).to eq("New description")
  end 

  it "displays and error with no artist" do
    update_shoot shoot: shoot,
                  artist: "",
                  description: "New description",
                  location: "New location"

    expect(page).to have_content("error")
  end

  it "displays and error with no description" do
    update_shoot shoot: shoot,
                  artist: "New artist",
                  description: "",
                  location: "New location"

    expect(page).to have_content("error")
  end

  it "displays and error with no location" do
    update_shoot shoot: shoot,
                  artist: "New artist",
                  description: "New description",
                  location: ""

    expect(page).to have_content("error")
  end
end