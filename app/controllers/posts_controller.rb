class PostsController < ApplicationController

  def index
    @tweets = Twitter.timeline("michaelcleyn", :count => 5)
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
