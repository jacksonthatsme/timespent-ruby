class SiteController < ApplicationController
  def index
    @videos = Shoot.published
  end
end
