class FbpostsController < ApplicationController
  def show
    
  end

  def create
    FbGraph::User.me(current_user.token).feed!(
          :message => params[:message]
         # :picture =>"http://sanjosecpafirms.com/wp-content/uploads/2011/03/san-jose-cpa-firms.jpg"
        )
        redirect_to fbpost_url
  end

end
