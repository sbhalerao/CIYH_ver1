class CatwalksController < ApplicationController
 
 before_filter :authenticate 
  
  def new
    @catwalk=current_user.catwalks.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catwalk }
    end
  end
  

  def create
    @catwalk=current_user.catwalks.new(params[:catwalk])
    respond_to do |format|
      if @catwalk.save
      format.html {redirect_to (@catwalk)}# new.html.erb
      format.xml  { render :xml => @catwalk }
       else
      format.html {render :action => "new"}# new.html.erb
      format.xml  { render :xml => @catwalk.errors, :status => :unprocessable_entity }
      end
    end
  
  end

  def show
    @catwalk=Catwalk.find(params[:id])
    respond_to do |format|
      format.html # sho.html.erb
      format.xml  { render :xml => @catwalk }
    end
  end

  def destroy
  end

 def vote_up
   @catwalk= Catwalk.find(params[:id])
         current_user.vote_for(@catwalk)
         respond_to do |format|
          
           format.js # new.html.erb
          
         end
         
    # rescue ActiveRecord::RecordInvalid
    #    render :nothing => true, :status => 404
   
 end
 
 def index
 @catwalks=Catwalk.paginate(:page => params[:page], :per_page => 10)
 
 end
 
 def authenticate
    deny_access unless current_user
 end

end
