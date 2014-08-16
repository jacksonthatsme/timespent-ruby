require 'rails_helper'

RSpec.describe UserSessionsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end

    it "renders the correct template" do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe "POST create" do
    context "with correct credentials" do
      let!(:user) {User.create(first_name: "Ronin", last_name: "Wood", email: "timespentwith@gmail.com", password: "poopdood", password_confirmation: "poopdood")}
      it "redirects to the home path" do
        post :create, email: "timespentwith@gmail.com", password: "poopdood"
        expect(response).to be_redirect

        expect(response).to redirect_to(site_index_path)
      end

      it "finds the user" do
        expect(User).to receive(:find_by).with({email:"timespentwith@gmail.com"}).and_return(user)
        post :create, email: "timespentwith@gmail.com", password: "poopdood"
      end

      it "authenticates the user" do
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email: "timespentwith@gmail.com", password: "poopdood"
      end

      it "sets the user_id in the session" do
        post :create, email: "timespentwith@gmail.com", password: "poopdood"
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context "with blank credentials" do
      it "renders the new template" do
        post :create
        expect(response).to render_template('new')
      end
    end

    context "with incorrect password" do
      let!(:user) {User.create(first_name: "Ronin", last_name: "Wood", email: "timespentwith@gmail.com", password: "poopdood", password_confirmation: "poopdood")}
      
      it "renders the new template" do
        post :create, email: user.email, password: "wrong"
        expect(response).to render_template('new')
      end
    end
  end

end
