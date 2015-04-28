class FeedChecker
	def parse_feeds(user)

		if user.urls != nil
			urls = user.urls

	      	urls.scheduled_today.find_each do |rss|
	       		@feed = Feedjira::Feed.fetch_and_parse rss.url
	       		entries = @feed.entries

		          entries.each do |entry|
		          	if entry.published > 1.day.ago
			            post = Post.new status: "[#{@feed.title}] #{entry.title} #{entry.url}", user_id: user.id
			            post.save
			        end
		        end
		    end
		end
	end

	def run
		User.includes(:urls).find_each do |user|
			parse_feeds(user)
		end
	end
end
