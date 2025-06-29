class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    assignment = @response.assignment

    if @response.save
      assignment.mark_completed if assignment.completed?
      redirect_to assignment_path(assignment)
    else
      head :unprocessable_entity
    end
  end

  private

  def response_params
    params.require(:response).permit(:question_id, :assignment_id, :content, :score)
  end
end
