require 'rails_helper'
require 'spec_helper'

describe 'Adding posts'  do

 def create_shoot(options={})
    options[:title] ||= "Post Title"
    options[:content] ||= ""

    visit '/shoots'
    click_link 'Add new shoot'
    expect(page).to have_content("New Shoot")

    fill_in "shoot[artist]", with: options[:artist]
    fill_in "shoot[description]", with: options[:description]
    fill_in "shoot[location]", with: options[:location]

    click_button "Create Shoot"
  end

end