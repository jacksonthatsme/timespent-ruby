require 'rails_helper'
require 'spec_helper'

describe 'Editing posts'  do

  let!(:post){Post.create(title: "Post Title", content: "This is the content")}

  def update_post(options={})

    options[:title] ||= "New post title"
    options[:content] ||= "New post content"

    post = options[:post]

    visit '/posts'

    within "#post_#{post.id}" do
      click_link "edit"
    end

    fill_in "post[title]", with: options[:title]
    fill_in "post[content]", with: options[:content]

    click_button "Update Post"
  end

  it "updates a shoot succesfully with correct information" do

    update_post post: post,
                  title: "New post title",
                  content: "New post content"

    post.reload

    expect(post.title).to eq("New post title")
    expect(post.content).to eq("New post content")
  end 

  it "displays and error with no artist" do
    update_post post: post,
                  title: "",
                  content: "New post content"

    expect(page).to have_content("error")
  end

  it "displays and error with no description" do
    update_post post: post,
                  title: "New post title",
                  content: ""

    expect(page).to have_content("error")
  end

end