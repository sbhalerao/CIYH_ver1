class ApplicationController < ActionController::Base
  
  protect_from_forgery
  

  
  layout "main"
  
  helper_method :current_user, :deny_access
  
  
  def deny_access
     redirect_to root_path, :notice => "Please sign in"
  end


 
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end
    
    #adding customer error pages for 404 and 500 errors 
    unless ActionController::Base.consider_all_requests_local
        rescue_from Exception, :with => :render_error
        rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
        rescue_from ActionController::RoutingError, :with => :render_not_found
        rescue_from ActionController::UnknownController, :with => :render_not_found
        rescue_from ActionController::UnknownAction, :with => :render_not_found
    end
    
    
 # to render 404 and 500 error pages   
    private

      def render_not_found(exception)
        #log_error(exception)
        render 'error/404.html.erb', :status => 404
      end

      def render_error(exception)
        #log_error(exception)
        render :template => "/error/500.html.erb", :status => 500
      end
 
end
