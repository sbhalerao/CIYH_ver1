class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :j_msg

    private  
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end
    
    def j_msg
      @j_msg = params[:msg]
    end
    
end
