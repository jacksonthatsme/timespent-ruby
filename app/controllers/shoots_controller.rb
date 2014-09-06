class ShootsController < ApplicationController
  def index
    @shoots = Shoot.all
  end

  def show
    @shoot = Shoot.find(params[:id])
  end
end
