class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new

    if current_user.urls != nil
      @urls = current_user.urls
    end
  end

  def show
  end

  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end
  end

  def tweets
    @user = params[:handle]
    @tweets = client.user_timeline(@user)
  end

  def tweet_now
    client.user(@user)
    @status = params[:status]
    client.update(@status)

    # post = Post.new status: @status, user_id: current_user.id, scheduled_date: params[:date]
    # post.save

    redirect_to posts_path
  end

  def send_tweet
    # client.user(@user)
    @status = params[:tweet]
    # client.update(@status)

    post = Post.new status: @status, user_id: current_user.id, scheduled_date: params[:date]
    post.save

    redirect_to dashboard_path
  end

  def new
    @post = Post.new
  end

  def create
    @feed = Feedjira::Feed.fetch_and_parse params[:url]
    @entries = @feed.entries

    # @entries.each do |entry|
    #   @post = Post.new status: "#{entry.title}, #{entry.url}"
    #   @post.save
    # end
  end

  def update
  end
end
