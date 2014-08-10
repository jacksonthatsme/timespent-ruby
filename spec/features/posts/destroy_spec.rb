require 'rails_helper'
require 'spec_helper'

describe 'Deleting posts'  do
  let!(:post){Post.create(title: "Post Title", content: "This is the content")}
  
  it "is sucessful when clicking destroy link" do
    visit '/posts'

    within "#post_#{post.id}" do
      click_link "show"
    end

    click_link "delete"

    expect(page).to_not have_content(post.title)
    expect(Post.count).to eq(0)
  end
end