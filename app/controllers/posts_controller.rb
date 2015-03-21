class PostsController < ApplicationController

  client = Twitter::REST::Client.new do |config|
    config.consumer_key    = ENV['TWITTER_KEY']
    config.consumer_secret = ENV['TWITTER_SECRET']
    config.access_token = ENV ["YOUR_ACCESS_TOKEN"]
    config.access_token_secret = ENV ["YOUR_ACCESS_SECRET"]
  end

  def index
  end

  def new
  end

  def create
  end

  def update
  end
end
