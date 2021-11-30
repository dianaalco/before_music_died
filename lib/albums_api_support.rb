class AlbumsApiSupport
	require 'uri'
  # base_uri "https://postman-echo.com"

  def self.albums_getter(albums)
  	uri = URI.parse("https://jsonplaceholder.typicode.com/#{albums}")
  	http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response_first = http.request(request)
    response = JSON.parse(response_first.body)
    response
  end

  def self.album_getter(album_id)
  	current_album = self.albums_getter("albums/#{album_id}")
  	current_album
  end

  def self.user_getter(user_id)
  	current_user = self.albums_getter("users/#{user_id}")
  	current_user
  end

  def self.user_albums(user_id)
  	albums_list = self.albums_getter("albums")
  	albums_list.each do |user|
  		albums_list << user if user['userId'] == user_id
    end
    albums_list
  end

  def self.photo_getter(album_id)
  	current_photos = self.albums_getter("photos?albumId=#{album_id}")
  	current_photos
  end
end