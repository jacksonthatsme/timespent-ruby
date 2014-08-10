require 'rails_helper'
require 'spec_helper'

describe 'Adding posts'  do

 def create_post(options={})
    options[:title] ||= "Post Title"
    options[:content] ||= "Post Content"

    visit '/posts'
    click_link 'New blog post'
    expect(page).to have_content("New post")

    fill_in "post[title]", with: options[:title]
    fill_in "post[content]", with: options[:content]

    click_button "Create Post"
  end

  it 'redirects to show page on success' do
    create_post

    expect(page).to have_content("Post Title")
  end

  it 'displays an error when shoot has no title' do
    create_post title: ""

    expect(page).to have_content("error")
  end

  it 'displays an error when shoot has no content' do
    create_post content: ""

    expect(page).to have_content("error")
  end
end