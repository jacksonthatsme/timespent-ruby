class ShootsController < ApplicationController
  def index
    @shoots = Shoot.all
  end
  def new
    @shoot = Shoot.new
  end
  def create
    @shoot = Shoot.new(shoot_params)

    if @shoot.save
      redirect_to @shoot
    else
      render 'new'
    end
  end

  def show
    @shoot = Shoot.find(params[:id])
  end

  def edit
    @shoot = Shoot.find(params[:id])
  end

  def update
    @shoot = Shoot.find(params[:id])

    if @shoot.update(shoot_params)
      redirect_to @shoot
    else
      render 'edit'
    end
  end

  def destroy
    @shoot = Shoot.find(params[:id])
    @shoot.destroy

    redirect_to shoots_path
  end
  private
    def shoot_params
      params.require(:shoot).permit(:artist, :description, :location, :shoot_image)
    end
end
