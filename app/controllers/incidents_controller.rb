class IncidentsController < ApplicationController
  skip_after_action :verify_authorized


  def index
    @incidents = policy_scope(Incident).order(created_at: :desc)
    @markers = @incidents.geocoded.map do |incident|
      {
        lat: incident.latitude,
        lng: incident.longitude
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

  end

  def destroy

  end

  private

  def incident_params
    params.require(:incident).permit(:title, :incident_type, :date, :time, :description, :photo)
  end
end
