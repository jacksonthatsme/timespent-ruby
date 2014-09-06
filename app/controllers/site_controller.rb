class SiteController < ApplicationController
  def index
    @videos = Shoot.all
  end
end
