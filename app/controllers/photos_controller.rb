class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all
  end

  def new_form
  end

  def show
    @selected_photo = Photo.find_by({:id=>params[:photo_id]})
  end

  def create_row
    @new_row = Photo.new
    @new_row.caption = params[:the_caption]
    @new_row.source = params[:the_source]
    @new_row.save

    redirect_to("http://localhost:3000/photos")
  end

  def destroy
    Photo.find_by({:id=>params[:photo_id]}).destroy

    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @selected_photo = Photo.find_by({:id=>params[:photo_id]})
  end

  def update_row
    @photo_id = params[:photo_id]
    @selected_photo = Photo.find_by({:id=>params[:photo_id]})
    @selected_photo.source = params[:new_source]
    @selected_photo.caption = params[:new_caption]
    @selected_photo.save

    redirect_to("http://localhost:3000/photos/" + @photo_id.to_s)
  end

end
