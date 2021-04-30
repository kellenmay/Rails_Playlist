class ApplicationController < ActionController::Base
    include UsersHelper
    include SongsHelper
    include PlaylistsHelper

    
    def welcome 
        if !logged_in?
            redirect_to login_path
        end 
    end 

end