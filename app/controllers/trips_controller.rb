class TripsController < ApplicationController

  before_action :authenticate_user!, except: :show

  def dashboard
    @trips = current_user.trips
  end

  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.save
      redirect_to trip_edit_path(current_user, @trip), :notice => 'Ok!'
    else
      render :action => 'new'
    end
  end

  def edit
    @trip = Trip.find_by_param(params[:id])
    @photos = @trip.photos
  end

  def upload_photos
    @trip = Trip.find_by_param(params[:format])
    @photo = @trip.photos.create(photo_params)
  end

  def show
    @trip = Trip.find_by_param(params[:id])
    render layout: display_layout
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :user_id, :photos_attributes => [:trip_id, :image])
  end

  def photo_params
    params.require(:photo).permit(:image, :trip_id)
  end

  def display_layout
    user_signed_in? ? 'application' : 'public'
  end

end