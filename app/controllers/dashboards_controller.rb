class DashboardsController < ApplicationController
  def index
  end

  def show
  	@posts = Post.all
  	@users = User.all
  	@urls = Url.all
  end

  def new
  end
end
