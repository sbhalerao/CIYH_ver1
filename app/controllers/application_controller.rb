class ApplicationController < ActionController::Base
  
  
  #this is the high level controller. Applies to all requests to the app
  
  protect_from_forgery
  
  
  layout "main"     #main.html.erb file in /app/views/layouts
  
  helper_method :current_user, :deny_access   #helper_method so that views may have access to it and is made unroutable as an action.
  
 # before_filter :ensure_domain    #this happends before any other method is executed

 # APP_DOMAIN = 'catsinyourhats.com'

 # def ensure_domain                                     #this method ensures that this Rails app always goes to catsinyourhats.com
 #   if request.env['HTTP_HOST'] != APP_DOMAIN
      # HTTP 301 is a "permanent" redirect
  #    redirect_to "http://#{APP_DOMAIN}", :status => 301
 #   end
 # end
  
  
  def deny_access
     redirect_to root_path, :notice => "Please sign in"
  end


 
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end
    

    
    
   
    
 
end
