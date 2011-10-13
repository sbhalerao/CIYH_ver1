class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  
  
  helper_method :current_user, :deny_access
  
  
  def deny_access
     redirect_to root_path, :notice => "Please sign in"
  end


 
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end
    
 
end
