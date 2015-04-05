class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end

    @user = params[:handle]
    @tweets = client.user_timeline(@user)



    # @boom = client.update(@status)
  end

  def update_tweet

    @status = params[:tweet]
    client.update(@status)
  end

  def send_tweet
    client.user(@user)
       @status = params[:tweet]
    client.update(@status)
  end

  def new
    @post = Post.new
  end

  def create
    feed = Feedjira::Feed.fetch_and_parse params[:url]
    @entries = feed.entries

    post = Post.new status: "#{@entries[0].title}, #{@entries[0].url}", handle: "donburi"
    post.save
  end

  def update
  end
end
