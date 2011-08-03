class FbpostsController < ApplicationController
  def show
    
  end

  def create
    FbGraph::User.me(current_user.token).feed!(
          :message => params[:message]
        )
        redirect_to fbpost_url
  end

end
