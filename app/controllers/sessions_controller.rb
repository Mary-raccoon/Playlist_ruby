class SessionsController < ApplicationController
  def index 
  end
  
  def login
    if User.find_by(email: params[:email]).try(:authenticate, params[:password])
      @user = User.find_by(email: params[:email])
      session[:user_id] = @user.id
      redirect_to "/songs"
    else 
      flash[:errors]="Invalid user email or password"
      redirect_to root_path
    end
  end
  def logout
    session[:id]= nil
    redirect_to "/"
  end
end