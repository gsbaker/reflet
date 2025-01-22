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
       redirect_to therapy_assignments_path(@therapy)
      else
        render :index, status: :unprocessable_entity
      end
    end

    private

    def assignment_params
      params.require(:assignment).permit(:assignable_id, :cadence)
    end
  end
end
