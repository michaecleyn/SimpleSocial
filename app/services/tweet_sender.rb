class TweetSender
	def client(user)
     client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = user.token
      config.access_token_secret = user.secret
    end
  end

	def run
		Post.scheduled_now.includes(:user).find_each do |post|
			client(post.user).update(post.status)
		end
	end
end
