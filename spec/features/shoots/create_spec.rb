require 'rails_helper'
require 'spec_helper'

describe 'Adding shoots'  do

  def create_shoot(options={})
    options[:artist] ||= "NYC SPELL"
    options[:description] ||= "This is the description please"
    options[:location] ||= "Brooklyn, NY"

    visit '/shoots'
    click_link 'Add new shoot'
    expect(page).to have_content("New Shoot")

    fill_in "shoot[artist]", with: options[:artist]
    fill_in "shoot[description]", with: options[:description]
    fill_in "shoot[location]", with: options[:location]

    click_button "Create Shoot"
  end
  
  it 'redirects to show page on success' do
    create_shoot

    expect(page).to have_content("NYC SPELL")
  end

  it 'displays an error when shoot has no artist' do
    create_shoot artist: " "

    expect(page).to have_content("error")
  end

  it 'displays an error when shoot has no description' do
    create_shoot description: " "

    expect(page).to have_content("error")
  end

  it 'displays an error when shoot has no location' do
    create_shoot location: " "

    expect(page).to have_content("error")
  end
end