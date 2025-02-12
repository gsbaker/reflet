module Therapies
  class AssignmentsController < BaseController
    def index
      @assignments = @therapy.assignments
      @assignment = @therapy.assignments.build
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

    def notify_assignee
      AssignmentMailer
        .with(assignment: @assignment)
        .new_assignment_email
        .deliver_later
    end
  end
end
