class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      flash[:notice] = 'You have been logged in successfully.'
      redirect_to root_path
    else
      flash[:alert] = 'There was a problem with your email address and/or password. Please try again.'
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = 'You have been logged out.'
    redirect_to root_path
  end
end
