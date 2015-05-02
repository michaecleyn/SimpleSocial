class DashboardsController < ApplicationController
	before_action :authenticate_user!
  def index
  end

  def show
  	@posts = current_user.posts
  	@users = current_user
  	@urls = current_user.urls
  end

  def new
    @user = User.urls
  end
end
