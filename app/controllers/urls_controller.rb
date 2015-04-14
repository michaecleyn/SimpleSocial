class UrlsController < ApplicationController

	def create
		u = Url.new url: params[:url], user_id: current_user.id
    	u.save

    	render 'index'
	end
end
