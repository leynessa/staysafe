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

   def update
    @location = Location.find(params[:id])
    @location.update(params[:location])
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    # no need for app/views/incidents/destroy.html.erb
    redirect_to locations_path
  end

  private

  def incident_params
    params.require(:location).permit(:name, :description, :photo)
  end
end
