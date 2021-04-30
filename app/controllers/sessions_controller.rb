class SessionsController < ApplicationController
  include ApplicationHelper
  
  def new # render the login form
    if logged_in?
      redirect_to users_path
    end 
  end

  def omniauth
      user = User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
        u.name = response[:info][:name]
        u.email = respose[:info][:email]
        u.password = SecureRandom.hex(15)
      end
        if user.valid?
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          redirect_to '/login'
      end

  end


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
    session.destroy
    redirect_to '/login'
  end
end



