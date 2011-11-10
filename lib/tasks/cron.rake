require 'uri'
require 'net/http'

desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
 #get homepage every one hour to keep the app in the server memory
   uri = URI.parse('http://high-robot-603.heroku.com/')
   Net::HTTP.get(uri)

end
