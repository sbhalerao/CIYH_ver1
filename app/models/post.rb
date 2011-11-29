class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, 
   :path =>"/avatars/:id/:style/:basename.:extension", :default_url => "/images/cat3.gif",
   :storage => :s3,
       :bucket => 'catsinyourhats',
       :s3_credentials => {
         :access_key_id => ENV['S3_KEY'],
         :secret_access_key => ENV['S3_SECRET']
       }
  
  def self.updatepost(post)
    require 'RMagick'
    include Magick
   
   
    @post=post
    

    #images. All images must be different files 
     #background image
  #   back= "#{RAILS_ROOT}/public/images/catsback.png"
      back= @post.backimg
      
     #cat images
     cat1= "#{RAILS_ROOT}/public/images/cat1.gif"
     cat2= "#{RAILS_ROOT}/public/images/cat2.gif"
     cat3= "#{RAILS_ROOT}/public/images/cat3.gif"
     cat4= "#{RAILS_ROOT}/public/images/cat4.gif"
     cat5= "#{RAILS_ROOT}/public/images/cat5.gif"
     cat6= "#{RAILS_ROOT}/public/images/cat6.gif"

     #hat images
     hat1= "#{RAILS_ROOT}/public/images/hat1.gif"
     hat2= "#{RAILS_ROOT}/public/images/hat2.gif"
     hat3= "#{RAILS_ROOT}/public/images/hat3.gif"
     hat4= "#{RAILS_ROOT}/public/images/hat4.gif"
     hat5= "#{RAILS_ROOT}/public/images/hat5.gif"
     hat6= "#{RAILS_ROOT}/public/images/hat6.gif"


      #Array of all images
     img_all=ImageList.new(back, cat1, cat2, cat3, cat4, cat5, cat6, hat1, hat2, hat3, hat4, hat5, hat6)


     #Array giving index of img_all which were moved
     moved=[@post.cat1move, @post.cat2move, @post.cat3move, @post.cat4move, @post.cat5move, @post.cat6move, @post.hat1move, @post.hat2move, @post.hat3move, @post.hat4move, @post.hat5move, @post.hat6move]


    # Dimension is the square dimension of each image 
     dimension_cat1= (@post.cat1h) > (@post.cat1w)?(@post.cat1h):(@post.cat1w)
     img_all[1]=img_all[1].resize_to_fit(dimension_cat1,dimension_cat1)
     img_all[1].page=Rectangle.new(@post.cat1h, @post.cat1w, @post.cat1x, (@post.cat1y)-(@post.backy))
     # 80 is subtracted to get the y co-ordinate wrt back image. Cat1y is wrt top left of page

     # Repeating for cat2
     dimension_cat2= (@post.cat2h) > (@post.cat2w)?(@post.cat2h):(@post.cat2w)
      img_all[2]=img_all[2].resize_to_fit(dimension_cat2,dimension_cat2)
      img_all[2].page=Rectangle.new(@post.cat2h, @post.cat2w, @post.cat2x, (@post.cat2y)-(@post.backy))

     #Repeating for cat3
     dimension_cat3= (@post.cat3h) > (@post.cat3w)?(@post.cat3h):(@post.cat3w)
        img_all[3]=img_all[3].resize_to_fit(dimension_cat3,dimension_cat3)
        img_all[3].page=Rectangle.new(@post.cat3h, @post.cat3w, @post.cat3x, (@post.cat3y)-(@post.backy))

       #Repeating for cat4 
        dimension_cat4= (@post.cat4h) > (@post.cat4w)?(@post.cat4h):(@post.cat4w)
        img_all[4]=img_all[4].resize_to_fit(dimension_cat4,dimension_cat4)
        img_all[4].page=Rectangle.new(@post.cat4h, @post.cat4w, @post.cat4x, (@post.cat4y)-(@post.backy))
        # 80 is subtracted to get the y co-ordinate wrt back image. Cat1y is wrt top left of page

        # Repeating for cat5
        dimension_cat5= (@post.cat5h) > (@post.cat5w)?(@post.cat5h):(@post.cat5w)
         img_all[5]=img_all[5].resize_to_fit(dimension_cat5,dimension_cat5)
         img_all[5].page=Rectangle.new(@post.cat5h, @post.cat5w, @post.cat5x, (@post.cat5y)-(@post.backy))

        #Repeating for cat3
        dimension_cat6= (@post.cat6h) > (@post.cat6w)?(@post.cat6h):(@post.cat6w)
           img_all[6]=img_all[6].resize_to_fit(dimension_cat6,dimension_cat6)
           img_all[6].page=Rectangle.new(@post.cat6h, @post.cat6w, @post.cat6x, (@post.cat6y)-(@post.backy))


     # When adding more cats or hats, change the image number index
    # Dimension is the square dimensaion of each image . Hat1 first
         dimension_hat1= (@post.hat1h) > (@post.hat1w)?(@post.hat1h):(@post.hat1w)
         img_all[7]=img_all[7].resize_to_fit(dimension_hat1,dimension_hat1)
         img_all[7].page=Rectangle.new(@post.hat1h, @post.hat1w, (@post.hat1x)-(@post.backx), (@post.hat1y)-(@post.backy))
    # 80 is subtracted to get the y co-ordinate wrt back image. Cat1y is wrt top left of page

         # Repeating for hat2
         dimension_hat2= (@post.hat2h) > (@post.hat2w)?(@post.hat2h):(@post.hat2w)
          img_all[8]=img_all[8].resize_to_fit(dimension_hat2,dimension_hat2)
          img_all[8].page=Rectangle.new(@post.hat2h, @post.hat2w, (@post.hat2x)-(@post.backx), (@post.hat2y)-(@post.backy))

         #Repeating for hat3
         dimension_hat3= (@post.hat3h) > (@post.hat3w)?(@post.hat3h):(@post.hat3w)
            img_all[9]=img_all[9].resize_to_fit(dimension_hat3,dimension_hat3)
            img_all[9].page=Rectangle.new(@post.hat3h, @post.hat3w, (@post.hat3x)-(@post.backx), (@post.hat3y)-(@post.backy))

        #Repeating for hat4
             dimension_hat4= (@post.hat4h) > (@post.hat4w)?(@post.hat4h):(@post.hat4w)
                img_all[10]=img_all[10].resize_to_fit(dimension_hat4,dimension_hat4)
                img_all[10].page=Rectangle.new(@post.hat4h, @post.hat4w, (@post.hat4x)-(@post.backx), (@post.hat4y)-(@post.backy))

                 #Repeating for hat5
                 dimension_hat5= (@post.hat5h) > (@post.hat5w)?(@post.hat5h):(@post.hat5w)
                    img_all[11]=img_all[11].resize_to_fit(dimension_hat5,dimension_hat5)
                    img_all[11].page=Rectangle.new(@post.hat5h, @post.hat5w, (@post.hat5x)-(@post.backx), (@post.hat5y)-(@post.backy))

                     #Repeating for hat6
                     dimension_hat6= (@post.hat6h) > (@post.hat6w)?(@post.hat6h):(@post.hat6w)
                        img_all[12]=img_all[12].resize_to_fit(dimension_hat6,dimension_hat6)
                        img_all[12].page=Rectangle.new(@post.hat6h, @post.hat6w, (@post.hat6x)-(@post.backx), (@post.hat6y)-(@post.backy))



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
     
    
  end
 
 
 def self.setCoordinates(post, params)
   @post=post
   
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
   
    
    #if background image choice is sent by user  
     if params[:backimg]!= nil
      
      #since the carousel img click sends full http address we are removing parts of it
     #  backimg_add= params[:backimg].split(".com")[1]
        @post.update_attributes(:backimg => "#{RAILS_ROOT}/public" + backimg_add)
     end
           
   
 end
 
  
  
end
