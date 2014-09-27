class SiteController < ApplicationController
  def index
    @videos = Shoot.published.order('created_at DESC')
    @shoot = Shoot.published.last
  end
end
