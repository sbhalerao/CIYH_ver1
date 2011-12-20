class Catwalk < ActiveRecord::Base
  belongs_to :user
  acts_as_voteable
  has_attached_file :catpic, :styles => { :thumb => "170x128>"},
   :path =>"/catpics/:id/:style/:basename.:extension",
   :storage => :s3,
       :bucket => 'catsinyourhats',
       :s3_credentials => {
         :access_key_id => ENV['S3_KEY'],
         :secret_access_key => ENV['S3_SECRET']
       }
    validates_attachment_presence :catpic
    validates_attachment_content_type :catpic, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
    validates :catname, :presence =>true
end
