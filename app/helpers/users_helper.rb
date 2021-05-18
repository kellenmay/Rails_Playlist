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

  def all_users
    @users = User.all
  end 
  
  def current_user_id
    session[:user_id]
  end

  def current_user_email
    if current_user
    @user = User.find_by_id(session[:user_id])
    @user.email

    end
  
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
    # binding.pry
    if user_playlists != []
    user_playlists.each do |p|
      @playlist_name = p.name
     end
    @playlist_name
    @playlist = Playlist.find_by_name(@playlist_name)
    link_to @playlist_name, playlist_path(@playlist)
  end
  end
 
  def profile_view_from_profile
    user_playlists.each do |p|
      @playlist_id = p.id
    end
    @playlist_id
  end
  
    
  def users_index_page
    @users.each do |user|
      user.email
    end
  end


end