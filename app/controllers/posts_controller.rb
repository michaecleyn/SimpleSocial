class PostsController < ApplicationController

  require 'twitter'

  def new
    @post = Post.new
  end

  client = Twitter::REST::Client.new do |config|
    config.consumer_key    = ENV['TWITTER_KEY']
    config.consumer_secret = ENV['TWITTER_SECRET']
    config.access_token = ENV["YOUR_ACCESS_TOKEN"]
    config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
  end

  def get_all_tweets(user)
    client.sample do |tweet|
      puts tweet.text
    end
  end

  def index
  end

  def create
  end

  def update
  end
end
