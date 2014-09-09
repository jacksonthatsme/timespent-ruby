class ShootsController < ApplicationController
  def index
    @shoots = Shoot.all
  end

  def show
    @shoot = Shoot.find(params[:id])
    @shoots = Shoot.all
    respond_to do |format|
     format.html #responds with default html file
     format.js #this will be the javascript file we respond with
    end
  end
end
