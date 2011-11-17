class CatwalksController < ApplicationController
 
 before_filter :authenticate 
  
  #to determine layout. Since new and show are in popbox, they need no header
  layout :determine_layout

   def determine_layout
     %w(new show create).include?(action_name) ? "application" : "main"
   end
   
  def new
    @catwalk=current_user.catwalks.new

    respond_to do |format|
      format.html { render :layout => "application"}  # new.html.erb
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
 
 #paginate in descending order and do not include first 17 entries
 def index
# @catwalks=Catwalk.order('catwalks.id DESC').limit(Catwalk.last.id-17).paginate(:page => params[:page], :per_page => 16)
 @catwalks=Catwalk.all.paginate(:page => params[:page], :per_page => 16);
 end
 
 def authenticate
    deny_access unless current_user
 end

 def yourcats
  @catwalks=Catwalk.order('catwalks.id DESC').limit(Catwalk.last.id-17).paginate(:page => params[:page], :per_page => 16) 
  respond_to do |format|
    
     format.html # new.html.erb
    
   end
 end
 
 def favorites
   @catwalks=Catwalk.order('catwalks.id DESC').limit(Catwalk.last.id-17).paginate(:page => params[:page], :per_page => 16)
   respond_to do |format|

      format.html # new.html.erb

    end
   
 end

end

