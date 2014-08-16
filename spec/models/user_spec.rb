require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:valid_attributes) {
    {
      first_name: "Ronin",
      last_name: "Wood",
      email: "timespentwith@gmail.com",
      password: "poopdood",
      password_confirmation: "poopdood"
    }
  }
  context "validations" do

    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires and email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "TIMESPENTWITH@GMAIL.com"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to appear to be an email address" do
      user.email = "ronin"
      expect(user).to_not be_valid
    end
  end

  context "#downcase_email" do
    it "makes the email attribute lowercase" do
      user = User.new(valid_attributes.merge(email: "TIMESPENTWITH@GMAIL.COM"))
      user.downcase_email
      expect(user.email).to eq("timespentwith@gmail.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "TIMESPENTWITH@GMAIL.COM"
      expect(user.save).to be_truthy
      expect(user.email).to eq("timespentwith@gmail.com")
    end
  end
end
