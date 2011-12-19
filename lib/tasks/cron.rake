

desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
 #get homepage every one hour to keep the app in the server memory
  puts "trying out cron"
  require 'uri'
  require 'net/http'
   uri = URI.parse('http://catsinyourhats.com/')
  Net::HTTP.get(uri)
  puts "cron executed"
end
