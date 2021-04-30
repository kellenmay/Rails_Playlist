class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    return redirect_to '/login' if !params[:email] || params[:email].empty?
    user = User.find_by(email: params[:email])
    user = user.try(:authenticate, params[:password])
    return redirect_to '/login' unless user
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end



