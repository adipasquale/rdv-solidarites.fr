class Agents::Rdvs::FirstStepsController < AgentAuthController
  layout 'application-small'

  def new
    rdv = Rdv.new(query_params)
    @agent = params[:agent_ids].present? ? Agent.find(params[:agent_ids].first) : current_agent
    @first_step = Rdv::FirstStep.new(rdv.to_step_params)
    @first_step.organisation_id = current_organisation.id
    skip_authorization
  end

  def create
    build_first_step
    skip_authorization
    if @first_step.valid?
      redirect_to new_organisation_second_step_path(@first_step.to_query)
    else
      render 'new'
    end
  end

  private

  def build_first_step
    rdv = Rdv.new(first_step_params)
    @first_step = Rdv::FirstStep.new(rdv.to_step_params)
    @first_step.organisation_id = current_organisation.id
  end

  def first_step_params
    params.require(:rdv).permit(:motif_id, :starts_at, :location, agent_ids: [])
  end

  def query_params
    params.permit(:motif_id, :starts_at, :location, :organisation_id, agent_ids: [])
  end
end
