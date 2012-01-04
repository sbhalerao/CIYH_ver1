class ApplicationController < ActionController::Base
  
  protect_from_forgery
  

  
  layout "main"
  
  helper_method :current_user, :deny_access
  
  before_filter :ensure_domain

  APP_DOMAIN = 'catsinyourhats.com'

  def ensure_domain
    if request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{APP_DOMAIN}", :status => 301
    end
  end
  
  
  def deny_access
     redirect_to root_path, :notice => "Please sign in"
  end


 
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end
    

    
    
   
    
 
end
