class ApplicationController < ActionController::Base
    include UsersHelper
    include SongsHelper
    include PlaylistsHelper
    def welcome 
        if !logged_in?
            redirect_to root_path
        end 
    end 

end