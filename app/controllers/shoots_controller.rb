class ShootsController < ApplicationController
  def index
    @shoots = Shoot.all
  end

  def show
    @shoot = Shoot.find(params[:id])
    @shoots = Shoot.all
    respond_to do |format|
     format.js
    end
  end
end
