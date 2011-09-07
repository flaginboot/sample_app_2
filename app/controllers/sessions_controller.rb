class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to user, :notice => "Signed in!"
    else
      flash.now.alert = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: 'Signed out'
  end
end

