class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assignment, only: %i[show update destroy]

  def index
    @assignments = current_user.assignments
  end

  def show
  end

  def create
    @assignment = Assignment.build(assignment_params)

    if @assignment.save!
      redirect_to therapy_path(@assignment.therapy)
    else
      render "questionnaires/show", status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def assignment_params
    params.require(:assignment).permit(:therapy_id, :assignable_id, :assignable_type, :cadence)
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
