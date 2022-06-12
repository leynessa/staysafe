class IncidentsController < ApplicationController
  skip_after_action :verify_authorized


  def index
    route = params[:route]
    if route.present?
      @destination = route[:destination]
      @location = Geocoder.search(@destination).first.coordinates
    end
    @incidents = policy_scope(Incident).order(created_at: :desc)
    @markers = @incidents.geocoded.map do |incident|
      {
        lat: incident.latitude,
        lng: incident.longitude,
        info_window: render_to_string(partial: "info_window", locals: { incident: incident })
      }
    end
  end

 def show
  @incident = Incident.find(params[:id])
  authorize @incident
 end


  def new
    @incident = Incident.new
    authorize @incident
  end

  def edit
	  @incident = Incident.find(params[:id])
	end

  def create
    @incident = Incident.new(incident_params)
    authorize @incident
   if @incident.save
    redirect_to incident_path(@incident)
   else
    render :new
   end
  end

   def update
    @incident = Incident.find(params[:id])
	  @incident.update(incident_params)
	  redirect_to incident_path(@incident)
  end

  def destroy
    @incident = Incident.find(params[:id])
		@incident.destroy
		redirect_to incidents_path
  end

  private

  def incident_params
    params.require(:incident).permit(:title, :incident_type, :date, :time, :description, :photo)
  end
end
