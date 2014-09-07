class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url, notice: "You are logged in!"
    else
      render action: 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root
  end
end
