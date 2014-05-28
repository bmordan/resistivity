class SessionsController < ApplicationController
  layout "login"
  
  def new
  end
  
  def create
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect_to surveys_path
    else
      flash[:notice] = "invalid email or password"
      render "new"
    end    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end  
end
