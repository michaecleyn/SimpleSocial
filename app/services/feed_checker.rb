class FeedChecker

	def parse_feeds(user)
			
		if user.urls != nil
			urls = user.urls

	      	urls.find_each do |rss|
	       		@feed = Feedjira::Feed.fetch_and_parse rss.url
	       		entries = @feed.entries

		          entries.each do |entry|

			            post = Post.new status: "[#{@feed.title}] #{entry.title} #{entry.url}"
			            post.save
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
