class PostsController < ApplicationController

  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end

    @user = params[:handle]
    @tweets = client.user_timeline(@user)
  end

  def new
    @post = Post.new
  end

  def get_all_tweets(user)
    client.sample do |tweet|
      puts tweet.text
    end
  end

  def create
  end

  def update
  end
end
