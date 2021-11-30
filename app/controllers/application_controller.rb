class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  require 'albums_api_support'
  def photos_for_album(album_id)
		@photo = AlbumsApiSupport.photo_getter(album_id)
		@photo[1]['thumbnailUrl']
	end
	helper_method :photos_for_album

	def photos_list_for_album(album_id)
		@photos = AlbumsApiSupport.photo_getter(album_id)
		@photos
	end
	helper_method :photos_list_for_album

	def user_owner(user_id)
		@user = AlbumsApiSupport.user_getter(user_id)['username']
	end
	helper_method :user_owner
end
