class OmniauthCallbacksController < ApplicationController

  def facebook
    user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider])
    if user
      user.password = "facebook_auth"
      session[:user_id] = user.id
      user.save
      redirect_to user_path(user)
    end
  end

  def auth
    request.env['omniauth.auth']
  end

end