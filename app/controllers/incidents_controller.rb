class IncidentsController < ApplicationController
  skip_after_action :verify_authorized
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
    authorize @incident
   if @incident.save
    redirect_to incident_path(@incident)
   else
    render :new
   end
  end

   def update
    @incident = Incident.find(params[:id])
    @incident.update(params[:incident])
    authorize @incident
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @incident = Incident.find(params[:id])
    @incident.destroy
    authorize @incident
    # no need for app/views/incidents/destroy.html.erb
    redirect_to incidents_path
  end

  private

  def incident_params
    params.require(:incident).permit(:title, :type, :date, :time, :description)
  end
end
