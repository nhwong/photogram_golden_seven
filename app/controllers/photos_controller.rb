class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @selected_photo = Photo.find_by({:id=>params[:photo_id].to_i})
  end

end
