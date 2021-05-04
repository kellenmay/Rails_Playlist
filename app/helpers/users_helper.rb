module UsersHelper
  

  def display_errors_for_user
    if @user.errors.any?
        content_tag(:h3, "Please note errors below:")
        content_tag(:ul) do
            @user.errors.full_messages.each do |m| 
                concat content_tag(:li, m) 
            end
        end
    end
  end
  
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

  def user_profile_page
    user_playlists.each do |p|
      @playlist_name = p.name
    end
    @playlist_name
  end
    
  def users_index_page
    @users.each do |user|
      user.email
    end
  end


end