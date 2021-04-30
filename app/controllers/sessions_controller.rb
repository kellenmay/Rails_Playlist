class SessionsController < ApplicationController
  include ApplicationHelper
  
  def new # render the login form
    if logged_in?
      redirect_to users_path
    end 
  end

  # def omniauth
  #     user.find_or_create_by
  # end


  def create # processing the login form
    # what do i need to do first?
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else 
      render :new
    end 
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end



