class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    #@photo = Photo.new(photo_params)
    #if @photo.save
    #  redirect_to dashboard_path, :notice => 'Ok!'
    #else
    #  render :action => 'new'
    #end
    @photo = Photo.create(photo_params)
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :trip_id)
  end

end
