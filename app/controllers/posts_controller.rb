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
   #cat1= "#{RAILS_ROOT}/public/images/gloria1.jpg"
   cat1= "#{RAILS_ROOT}/public/images/back.jpg"
   cat2= "#{RAILS_ROOT}/public/images/gloria2.jpg"
   images=ImageList.new(cat1, cat2)
   # images[1].page=Rectangle.new(images[1].columns, images[1].rows, @post.cat1x, @post.cat1y)
   images[1]=images[1].resize_to_fit(150,125)
   images[1].page=Rectangle.new(150, 110, @post.cat1x, (@post.cat1y)-85)
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
    # @post= Post.find(params[:id])
    # @message=params[:msg]
   # @message="hello world"
   @post=Post.last
  if params[:pid]=="cat1"
     @post.update_attributes(:cat1x => params[:left])
     @post.update_attributes(:cat1y => params[:top])
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
