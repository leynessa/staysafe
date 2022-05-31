class IncidentsController < ApplicationController
  def index
    @incidents = policy_scope(Incident).order(created_at: :desc)
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
    @incident.user = current_user
    authorize @incident
   if @incident.save
    redirect_to incident_path(@incident)
   else
    render :new
   end
  end

  private

  def incident_params
    params.require(:incident).permit(:name, :description, :photo)
  end
end
