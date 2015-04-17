desc "This task is called by the Heroku scheduler add-on"
task :send_tweet => :environment do

  	TweetSender.new.run
  	
end

task :grab_feeds => :environment do

  	FeedChecker.new.run
  	
end
