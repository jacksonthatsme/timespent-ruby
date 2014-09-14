class SiteController < ApplicationController
  def index
    @videos = Shoot.published
    @shoot = Shoot.published.last
  end
end
