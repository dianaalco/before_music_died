class UsersController < ApplicationController
	def show
		@user = AlbumsApiSupport.user_getter(params[:id])
		@user_albums = AlbumsApiSupport.user_albums(params[:id]).paginate(per_page: 10, page: params[:page])
	end
end
