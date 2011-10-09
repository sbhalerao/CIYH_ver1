
class User < ActiveRecord::Base
  #need to have one relationship per line
   has_many :posts 
   has_many :catwalks 
   acts_as_voter

  def self.create_with_omniauth(auth)  
      create! do |user|  
        user.provider = auth["provider"]  
        user.uid = auth["uid"]  
        user.name = auth["user_info"]["name"] 
        user.token = auth["credentials"]["token"]
       end
  end  
end  

