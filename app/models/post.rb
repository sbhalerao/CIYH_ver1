class Post < ActiveRecord::Base
 
  has_attached_file :avatar, :url  => "/avatars/:id/:style/:basename.:extension",
    :path => ":rails_root/public/avatars/:id/:style/:basename.:extension"
  
end
