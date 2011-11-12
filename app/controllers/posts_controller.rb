class PostsController < ApplicationController
  


  require 'RMagick'
  include Magick
  
  # GET /posts
  # GET /posts.xml
  before_filter :authenticate, :except => [:index, :front_page]
 layout :determine_layout
 
 def determine_layout
   %w(new).include?(action_name) ? "photos" : "main"
 end
 
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
     # @post=Post.new
     # @post=Post.create()
       @post=current_user.posts.create()
   
    
    respond_to do |format|
      format.html  # new.html.erb
      format.xml  
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    tmpfile=Tempfile.new('my_pic')
    cat1= "#{RAILS_ROOT}/public/images/gloria1.jpg"
    cat2= "#{RAILS_ROOT}/public/images/gloria2.jpg"
    images=ImageList.new(cat1, cat2)
    images[1].page=Rectangle.new(images[1].columns, images[1].rows, 20, 200)
    com_img=images.flatten_images
    com_img.write(tmpfile.path)
    @post = Post.create(:avatar => tmpfile)
    # @post.save
    # @post.avatar="/images/cute-kitten.jpg"

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
   # @post = Post.find(params[:id])
   
   #  @post=Post.last
   @post=current_user.posts.last
   Post.updatepost(@post)
   
   
    respond_to do |format|
      #if @post.update_attributes(params[:post])require File.dirname(__FILE__) + '/posts_controller'
      
      if @post.update_attributes(:avatar => tmpfile)
       if current_user 
     
       #  puts current_user.token 
       # FbGraph::User.me(current_user.token).feed!(
       # :picture =>@post.avatar.url
       #   ) 
 
             FbGraph::User.me(current_user.token).photo!(
          
             :url => @post.avatar.url
            )
             
      end  
      
      
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def sayhello
 
  # @post=Post.last
  @post=current_user.posts.last
   
   # Set co-ordinates for cats
  if params[:pid]=="cat1"
     @post.update_attributes(:cat1x => params[:left])
     @post.update_attributes(:cat1y => params[:top])
     @post.update_attributes(:cat1move => 1)
     @post.update_attributes(:backx => params[:backx])
     @post.update_attributes(:backy => params[:backy])
   elsif params[:pid]=="cat2"
        @post.update_attributes(:cat2x => params[:left])
        @post.update_attributes(:cat2y => params[:top])
        @post.update_attributes(:cat2move => 1)
        @post.update_attributes(:backx => params[:backx])
        @post.update_attributes(:backy => params[:backy])
   elsif params[:pid]=="cat3"
            @post.update_attributes(:cat3x => params[:left])
            @post.update_attributes(:cat3y => params[:top])
            @post.update_attributes(:cat3move => 1)
            @post.update_attributes(:backx => params[:backx])
            @post.update_attributes(:backy => params[:backy])
   elsif params[:pid]=="cat4"
              @post.update_attributes(:cat4x => params[:left])
                    @post.update_attributes(:cat4y => params[:top])
                    @post.update_attributes(:cat4move => 1)
                    @post.update_attributes(:backx => params[:backx])
                    @post.update_attributes(:backy => params[:backy])
                   elsif params[:pid]=="cat5"
                            @post.update_attributes(:cat5x => params[:left])
                            @post.update_attributes(:cat5y => params[:top])
                            @post.update_attributes(:cat5move => 1)
                            @post.update_attributes(:backx => params[:backx])
                            @post.update_attributes(:backy => params[:backy])
                           elsif params[:pid]=="cat6"
                                    @post.update_attributes(:cat6x => params[:left])
                                    @post.update_attributes(:cat6y => params[:top])
                                    @post.update_attributes(:cat6move => 1)
                                    @post.update_attributes(:backx => params[:backx])
                                    @post.update_attributes(:backy => params[:backy])
   end
   
   #Set size for cats
   if params[:rid]=="cat1"
       @post.update_attributes(:cat1h => params[:height])
       @post.update_attributes(:cat1w => params[:width])
   elsif params[:rid]=="cat2"
        @post.update_attributes(:cat2h => params[:height])
        @post.update_attributes(:cat2w => params[:width])
   elsif params[:rid]=="cat3"
            @post.update_attributes(:cat3h => params[:height])
            @post.update_attributes(:cat3w => params[:width])
   elsif params[:rid]=="cat4"
                   @post.update_attributes(:cat4h => params[:height])
                   @post.update_attributes(:cat4w => params[:width])
                 elsif params[:rid]=="cat5"
                          @post.update_attributes(:cat5h => params[:height])
                          @post.update_attributes(:cat5w => params[:width])
                        elsif params[:rid]=="cat6"
                                 @post.update_attributes(:cat6h => params[:height])
                                 @post.update_attributes(:cat6w => params[:width])
   end
     

   # Set co-ordinates for hats
   if params[:pid]=="hat1"
      @post.update_attributes(:hat1x => params[:left])
      @post.update_attributes(:hat1y => params[:top])
      @post.update_attributes(:hat1move => 1)
      @post.update_attributes(:backx => params[:backx])
      @post.update_attributes(:backy => params[:backy])
    elsif params[:pid]=="hat2"
         @post.update_attributes(:hat2x => params[:left])
         @post.update_attributes(:hat2y => params[:top])
         @post.update_attributes(:hat2move => 1)
         @post.update_attributes(:backx => params[:backx])
         @post.update_attributes(:backy => params[:backy])
    elsif params[:pid]=="hat3"
             @post.update_attributes(:hat3x => params[:left])
             @post.update_attributes(:hat3y => params[:top])
             @post.update_attributes(:hat3move => 1)
             @post.update_attributes(:backx => params[:backx])
             @post.update_attributes(:backy => params[:backy])
          elsif params[:pid]=="hat4"
                    @post.update_attributes(:hat4x => params[:left])
                    @post.update_attributes(:hat4y => params[:top])
                    @post.update_attributes(:hat4move => 1)
                    @post.update_attributes(:backx => params[:backx])
                    @post.update_attributes(:backy => params[:backy])
                    elsif params[:pid]=="hat5"
                             @post.update_attributes(:hat5x => params[:left])
                             @post.update_attributes(:hat5y => params[:top])
                             @post.update_attributes(:hat5move => 1)
                             @post.update_attributes(:backx => params[:backx])
                             @post.update_attributes(:backy => params[:backy])
                             elsif params[:pid]=="hat6"
                                      @post.update_attributes(:hat6x => params[:left])
                                      @post.update_attributes(:hat6y => params[:top])
                                      @post.update_attributes(:hat6move => 1)
                                      @post.update_attributes(:backx => params[:backx])
                                      @post.update_attributes(:backy => params[:backy])
                                    elsif (params[:rid]== nil && params[:pid]== nil)
                                      @post.update_attributes(:backx => params[:backx])
                                      @post.update_attributes(:backy => params[:backy])
    end

    #Set size for hats
    if params[:rid]=="hat1"
        @post.update_attributes(:hat1h => params[:height])
        @post.update_attributes(:hat1w => params[:width])
    elsif params[:rid]=="hat2"
         @post.update_attributes(:hat2h => params[:height])
         @post.update_attributes(:hat2w => params[:width])
    elsif params[:rid]=="hat3"
         @post.update_attributes(:hat3h => params[:height])
         @post.update_attributes(:hat3w => params[:width])
        elsif params[:rid]=="hat4"
              @post.update_attributes(:hat4h => params[:height])
              @post.update_attributes(:hat4w => params[:width])
             elsif params[:rid]=="hat5"
                   @post.update_attributes(:hat5h => params[:height])
                   @post.update_attributes(:hat5w => params[:width])
                  elsif params[:rid]=="hat6"
                        @post.update_attributes(:hat6h => params[:height])
                        @post.update_attributes(:hat6w => params[:width])
    end     
     
   respond_to do |format|
     format.js
  
   end
  end
  
  def authenticate
    deny_access unless current_user
  end 


  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end

# code for the front_page of the website
def front_page
  respond_to do |format|
    format.html # front_page.html.erb
  end
end


def share_link
  if current_user
     redirect_to(new_post_path) 
    
  else
    respond_to do |format|
      format.js 
    end
  end  
end
