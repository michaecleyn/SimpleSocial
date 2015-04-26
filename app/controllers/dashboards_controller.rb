class DashboardsController < ApplicationController
  def index
  end

  def show
  	@posts = current_user.posts
  	@users = current_user
  	@urls = current_user.urls
  end

  def new
  end
end
