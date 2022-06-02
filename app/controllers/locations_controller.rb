class LocationsController < ApplicationController
   def index
    @locations = Location.all
  end

 def show
  @location = Location.find(params[:id])
 end


  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
   if @location.save
    redirect_to location_path(@location)
   else
    render :new
   end
  end

  private

  def incident_params
    params.require(:location).permit(:name, :description, :photo)
  end
end
