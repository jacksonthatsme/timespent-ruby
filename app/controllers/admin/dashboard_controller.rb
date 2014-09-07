class Admin::DashboardController < ApplicationController

  before_action :require_user

  def index
    @shoots = Shoot.all
    @posts = Post.all
  end
end
