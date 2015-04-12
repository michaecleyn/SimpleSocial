class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def client_method
     client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end
  end

  def tweets
    @user = params[:handle]
    @tweets = client_method.user_timeline(@user)
  end

  def send_tweet
    client_method.user(@user)
    @status = params[:tweet]
    client_method.update(@status)
    redirect_to root_path
  end

  def new
    @post = Post.new
  end

  def create
    u = Url.new url: "#{params[:url]}", user_id: current_user.id
    u.save

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
