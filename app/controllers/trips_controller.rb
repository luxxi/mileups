class TripsController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @trips = current_user.trips
  end

  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.save
      redirect_to edit_trip_path(@trip), :notice => 'Ok!'
    else
      render :action => 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    @photos = @trip.photos
  end

  def upload_photos
    @trip = Trip.find(params[:trip_id])
    @photo = @trip.photos.create(photo_params)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :user_id, :photos_attributes => [:trip_id, :image])
  end

  def photo_params
    params.require(:photo).permit(:image, :trip_id)
  end

end

