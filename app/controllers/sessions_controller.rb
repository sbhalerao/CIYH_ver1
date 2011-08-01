class SessionsController < ApplicationController  
  def create  
    auth = request.env["omniauth.auth"]  
       user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)  
           session[:user_id] = user.id  
           redirect_to root_url, :notice => "Signed in!"  
      end
      
      def failure
        flash[:error] = 'There was an error at the remote authentication service. You have not been signed in.'
        redirect_to "http://www.google.com", :notice => "Failed to sign in!" 
      end
      
      def destroy
        session[:user_id]=nil
        redirect_to root_url, :notice => "Signed out!"
        
      end
      
end
