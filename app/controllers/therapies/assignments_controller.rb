# frozen_string_literal: true

module Therapies
  class AssignmentsController < BaseController
    before_action :set_assignment, only: [:show, :destroy]
    before_action :redirect_non_therapists, except: [:index, :show]

    def index
      @open_assignments = @therapy.assignments.open.includes(:assignable)
      @completed_assignments_by_month = @therapy.completed_assignments_by_month
      @assignment = @therapy.assignments.build
    end

    def show
      return redirect_to @assignment unless current_user.therapist?

      return unless @assignment.assignable.is_a? Questionnaire

      @questionnaire = @assignment.assignable
      @question = @questionnaire.unanswered_questions(@assignment)&.first
      @response = @assignment.responses.build if @question.present?
    end

    def destroy
      return unless current_user.therapist?

      @assignment.destroy

      redirect_to therapy_assignments_path(@therapy), notice: "Assignment deleted successfully."
    end

    def create
      @assignment = @therapy.assignments.build(assignment_params)
      @assignment.assignable_type = "Questionnaire"

      if @assignment.save!
        notify_assignee
        redirect_to therapy_assignments_path(@therapy)
      else
        render :index, status: :unprocessable_entity
      end
    end

    private

    def assignment_params
      params.require(:assignment).permit(:assignable_id, :cadence)
    end

    def set_assignment
      @assignment = @therapy.assignments.find(params[:id])
    end

    def notify_assignee
      AssignmentMailer
        .with(assignment: @assignment)
        .new_assignment_email
        .deliver_later
    end
  end
end
