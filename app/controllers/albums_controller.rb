class AlbumsController < ApplicationController
  def index
	  current_albums = AlbumsApiSupport.albums_getter('albums').paginate(per_page: 10, page: params[:page])
		@albums = Rails.cache.fetch("albums/index",
                                 expires_in: 24.hours) {
                                 current_albums }
	end

	def show
		@user = AlbumsApiSupport.user_getter(params[:id])
		@albums = photos_list_for_album(params[:id]).paginate(per_page: 10, page: params[:page])
	end
end
