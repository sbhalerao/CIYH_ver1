class Post < ActiveRecord::Base
 
  has_attached_file :avatar, 
   :storage => :s3,
       :bucket => 'catsinyourhats',
       :s3_credentials => {
         :access_key_id => ENV['S3_KEY'],
         :secret_access_key => ENV['S3_SECRET']
       }
  
end
