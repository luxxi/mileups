class TripsController < ApplicationController

  def dashboard
    @trips ||= current_user.trips
  end

  def new
    @trip = Trip.new
    @trip.photos.build
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to edit_trip_path(@trip), :notice => 'Ok!'
    else
      render :action => 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :user_id, :photos_attributes => [:trip_id, :image])
  end

end

