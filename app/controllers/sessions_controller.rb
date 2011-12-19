class SessionsController < ApplicationController  
  def create  
    auth = request.env["omniauth.auth"]  
     user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)  
     # user = User.create_with_omniauth(auth)
    # user.token = auth["credentials"]["token"]        #in case token changes after account is created
     user.update_attributes(:token => auth["credentials"]["token"])
     
     session[:user_id] = user.id  
    # redirect_to root_url, :notice => "Signed in!"  
    redirect_to session[:redirect_to] || root_path
    session[:redirect_to] = nil
      end
      
      def failure
        flash[:error] = 'There was an error at the remote authentication service. You have not been signed in.'
        redirect_to "http://catsinyourhats.com", :notice => "Failed to sign in!" 
      end
      
      def destroy
        session[:user_id]=nil
        redirect_to root_url, :notice => "Signed out!"
        
      end
      
end
