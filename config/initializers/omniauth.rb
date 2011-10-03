Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'AnSYCY4bRcmfUBJODfpmQ', 'GyvfClXeCLXL4NJBKGU7glpXDMfVDBN37pjjeQzFzw'
  provider :facebook, '250050248346256','9735ae616f47b11f109748800d05f877', {:scope => "user_about_me,user_interests,user_likes,user_online_presence,user_photo_video_tags,user_photos,user_status,user_videos,user_website,email,read_friendlists,read_stream,publish_stream,offline_access,friends_likes,friends_online_presence,friends_photo_video_tags,friends_photos"}
end