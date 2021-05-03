module UsersHelper
  
  def current_user_id
    session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def require_logged_in
    redirect_to '/login' unless current_user_id
  end

  def user_playlists
    @user_playslists= []
  
      Playlist.all.each do |p|
          if p.user_id == current_user_id
             @user_playslists << p
          end
        end
    return @user_playslists
  end






end