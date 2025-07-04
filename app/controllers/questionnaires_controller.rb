class QuestionnairesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_non_therapists
  before_action :set_questionnaire, only: [:show, :assign]

  def show
    @assignment = @questionnaire.assignments.build assignable: @questionnaire
  end

  def assign
    @assignment = Assignment.build(assignment_params)

    if @assignment.save
      redirect_to therapy_path(@assignment.therapy)
    else
      render "questionnaires/show", status: :unprocessable_entity
    end
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find_by!(slug: params[:slug])
  end

  def assignment_params
    params.require(:assignment).permit(:therapy_id, :assignable_id, :assignable_type, :cadence)
  end
end
