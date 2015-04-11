class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end
    @user = params[:handle]
    @tweets = client.user_timeline(@user)
  end

  def send_tweet
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
    client.user(@user)
    @status = params[:tweet]
    client.update(@status)
  end

  def new
    @post = Post.new
  end

  def create
    @feed = Feedjira::Feed.fetch_and_parse params[:url]
    @entries = @feed.entries

    @entries.each do |entry|
      @post = Post.new status: "#{entry.title}, #{entry.url}", handle: "donburi"
      @post.save
    end

  end

  def update
  end
end
