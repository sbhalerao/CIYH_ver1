class PostsController < ApplicationController
  require 'RMagick'
  include Magick
  
  # GET /posts
  # GET /posts.xml
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
     @post=Post.create()
    respond_to do |format|
      format.html # new.html.erb
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
     @post=Post.last
   tmpfile=Tempfile.new('my_pic')
   
   back= "#{RAILS_ROOT}/public/images/back.jpg"
   cat1= "#{RAILS_ROOT}/public/images/gloria1.jpg"
   cat2= "#{RAILS_ROOT}/public/images/gloria2.jpg"
   cat3= "#{RAILS_ROOT}/public/images/gloria3.jpg"
   images=ImageList.new(back, cat1, cat2, cat3)
  
   dimension_cat1= (@post.cat1h) > (@post.cat1w)?(@post.cat1h):(@post.cat1w)
   images[1]=images[1].resize_to_fit(dimension_cat1,dimension_cat1)
   images[1].page=Rectangle.new(@post.cat1h, @post.cat1w, @post.cat1x, (@post.cat1y)-85)
   
   dimension_cat2= (@post.cat2h) > (@post.cat2w)?(@post.cat2h):(@post.cat2w)
    images[2]=images[2].resize_to_fit(dimension_cat2,dimension_cat2)
    images[2].page=Rectangle.new(@post.cat2h, @post.cat2w, @post.cat2x, (@post.cat2y)-85)
   
   dimension_cat3= (@post.cat3h) > (@post.cat3w)?(@post.cat3h):(@post.cat3w)
      images[3]=images[3].resize_to_fit(dimension_cat3,dimension_cat3)
      images[3].page=Rectangle.new(@post.cat3h, @post.cat3w, @post.cat3x, (@post.cat3y)-85)
   
   
   com_img=images.flatten_images
   com_img.write(tmpfile.path)
 

    respond_to do |format|
      #if @post.update_attributes(params[:post])require File.dirname(__FILE__) + '/posts_controller'
      
      if @post.update_attributes(:avatar => tmpfile)
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def sayhello
 
   @post=Post.last
  if params[:pid]=="cat1"
     @post.update_attributes(:cat1x => params[:left])
     @post.update_attributes(:cat1y => params[:top])
   elsif params[:pid]=="cat2"
        @post.update_attributes(:cat2x => params[:left])
        @post.update_attributes(:cat2y => params[:top])
   elsif params[:pid]=="cat3"
            @post.update_attributes(:cat3x => params[:left])
            @post.update_attributes(:cat3y => params[:top])
   end
   
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
     
   respond_to do |format|
     format.js
  
   end
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
