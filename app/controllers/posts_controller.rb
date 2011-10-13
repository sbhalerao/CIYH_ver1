class PostsController < ApplicationController
  


  require 'RMagick'
  include Magick
  
  # GET /posts
  # GET /posts.xml
  before_filter :authenticate, :except => [:index, :front_page]
  
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
      format.html {render :layout => "photos"} # new.html.erb
      format.xml  { render :xml => @post }
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
   
   tmpfile=Tempfile.new('my_pic')
  
  #images. All images must be different files 
   #background image
   back= "#{RAILS_ROOT}/public/images/back.jpg"
   
   #cat images
   cat1= "#{RAILS_ROOT}/public/images/cat1.gif"
   cat2= "#{RAILS_ROOT}/public/images/cat2.gif"
   cat3= "#{RAILS_ROOT}/public/images/cat3.gif"
   
   #hat images
   hat1= "#{RAILS_ROOT}/public/images/hat1.gif"
   hat2= "#{RAILS_ROOT}/public/images/hat2.gif"
   hat3= "#{RAILS_ROOT}/public/images/hat3.gif"
    
    
    #Array of all images
   img_all=ImageList.new(back, cat1, cat2, cat3, hat1, hat2, hat3)
   
   
   #Array giving index of img_all which were moved
   moved=[@post.cat1move, @post.cat2move, @post.cat3move, @post.hat1move, @post.hat2move, @post.hat3move]
  

  # Dimension is the square dimension of each image 
   dimension_cat1= (@post.cat1h) > (@post.cat1w)?(@post.cat1h):(@post.cat1w)
   img_all[1]=img_all[1].resize_to_fit(dimension_cat1,dimension_cat1)
   img_all[1].page=Rectangle.new(@post.cat1h, @post.cat1w, @post.cat1x, (@post.cat1y)-80)
   # 80 is subtracted to get the y co-ordinate wrt back image. Cat1y is wrt top left of page
   
   # Repeating for cat2
   dimension_cat2= (@post.cat2h) > (@post.cat2w)?(@post.cat2h):(@post.cat2w)
    img_all[2]=img_all[2].resize_to_fit(dimension_cat2,dimension_cat2)
    img_all[2].page=Rectangle.new(@post.cat2h, @post.cat2w, @post.cat2x, (@post.cat2y)-80)
   
   #Repeating for cat3
   dimension_cat3= (@post.cat3h) > (@post.cat3w)?(@post.cat3h):(@post.cat3w)
      img_all[3]=img_all[3].resize_to_fit(dimension_cat3,dimension_cat3)
      img_all[3].page=Rectangle.new(@post.cat3h, @post.cat3w, @post.cat3x, (@post.cat3y)-80)
   
   
   # When adding more cats or hats, change the image number index
  # Dimension is the square dimensaion of each image . Hat1 first
       dimension_hat1= (@post.hat1h) > (@post.hat1w)?(@post.hat1h):(@post.hat1w)
       img_all[4]=img_all[4].resize_to_fit(dimension_hat1,dimension_hat1)
       img_all[4].page=Rectangle.new(@post.hat1h, @post.hat1w, @post.hat1x, (@post.hat1y)-80)
  # 80 is subtracted to get the y co-ordinate wrt back image. Cat1y is wrt top left of page

       # Repeating for hat2
       dimension_hat2= (@post.hat2h) > (@post.hat2w)?(@post.hat2h):(@post.hat2w)
        img_all[5]=img_all[5].resize_to_fit(dimension_hat2,dimension_hat2)
        img_all[5].page=Rectangle.new(@post.hat2h, @post.hat2w, @post.hat2x, (@post.hat2y)-80)

       #Repeating for hat3
       dimension_hat3= (@post.hat3h) > (@post.hat3w)?(@post.hat3h):(@post.hat3w)
          img_all[6]=img_all[6].resize_to_fit(dimension_hat3,dimension_hat3)
          img_all[6].page=Rectangle.new(@post.hat3h, @post.hat3w, @post.hat3x, (@post.hat3y)-80)
   
  #Construct Array of images to be saved in the final image (com_img)
   images=ImageList.new
   images[0]=img_all[0]
   images_index=1    #index of images to be included in com_img. Start from 1 coz background image stays same
   for i in 1..(img_all.length)-1
     if moved[i-1]==1        #if image was moved, include it. Moved array starts from 0
       images[images_index]=img_all[i]
       images_index= images_index+1
     end
   end
   
   #Combine and flatten images
   com_img=images.flatten_images
   com_img.write(tmpfile.path)
 

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
   elsif params[:pid]=="cat2"
        @post.update_attributes(:cat2x => params[:left])
        @post.update_attributes(:cat2y => params[:top])
        @post.update_attributes(:cat2move => 1)
   elsif params[:pid]=="cat3"
            @post.update_attributes(:cat3x => params[:left])
            @post.update_attributes(:cat3y => params[:top])
            @post.update_attributes(:cat3move => 1)
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
   end
     

   # Set co-ordinates for hats
   if params[:pid]=="hat1"
      @post.update_attributes(:hat1x => params[:left])
      @post.update_attributes(:hat1y => params[:top])
      @post.update_attributes(:hat1move => 1)
    elsif params[:pid]=="hat2"
         @post.update_attributes(:hat2x => params[:left])
         @post.update_attributes(:hat2y => params[:top])
         @post.update_attributes(:hat2move => 1)
    elsif params[:pid]=="hat3"
             @post.update_attributes(:hat3x => params[:left])
             @post.update_attributes(:hat3y => params[:top])
             @post.update_attributes(:hat3move => 1)
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
  if current_user?
    redirect_to new_posts_path
  else
    respond_to do |format|
      format.js 
    end
  end  
end
