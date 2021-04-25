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
  end