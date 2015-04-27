desc "This task is called by the Heroku scheduler add-on"

task :send_tweet => :environment do

  	TweetSender.new.run
  	
end

desc "I grab new posts."

task :grab_posts => :environment do

  	FeedChecker.new.run
  	
end

