class Catwalk < ActiveRecord::Base
  acts_as_voteable
  has_attached_file :catpic, 
   :path =>"/catpics/:id/:style/:basename.:extension",
   :storage => :s3,
       :bucket => 'catsinyourhats',
       :s3_credentials => {
         :access_key_id => ENV['S3_KEY'],
         :secret_access_key => ENV['S3_SECRET']
       }
end
