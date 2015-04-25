class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def new
		@url = Url.new
	end

	def create
		@url = current_user.urls.build url_params
    @url.save

	 	redirect_to  urls_path
	end

	def url_params
		params.require(:url).permit(:url, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
	end
end
