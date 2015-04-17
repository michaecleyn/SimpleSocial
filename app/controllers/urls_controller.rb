class UrlsController < ApplicationController

	def new
		@url = Url.new
		render 'index'
	end

	def create
		@url = Url.new url: params[:url], user_id: current_user.id
    @url.save

    render 'index'
	end
end
