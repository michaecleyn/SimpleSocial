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

    	flash[:notice] = "Feed successfully saved"

	 	redirect_to action: "new"
	end

	def url_params
		params.require(:url).permit(:url, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
	end

	def show
	end

	def edit
	end

	def update
		url = Url.find(params[:id])
		url.update(url_params)
		url.save

		flash[:notice] = "Feed settings successfully updated"

		redirect_to action: "new"
	end
end
