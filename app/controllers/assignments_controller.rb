class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assignment, only: %i[show destroy]

  def index
    @assignments = current_user.assignments
  end

  def show
    return unless @assignment.assignable.is_a? Questionnaire

    @questionnaire = @assignment.assignable
    @question = @questionnaire.unanswered_questions(@assignment)&.first
    @response = @assignment.responses.build if @question.present?
  end

  def update
    @assignment = Assignment.find(params[:id])
  end

  def destroy
    return unless current_user.therapist?

    @assignment.destroy

    redirect_to therapy_path(@assignment.therapy)
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
