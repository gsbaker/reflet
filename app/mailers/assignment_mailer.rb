class AssignmentMailer < ApplicationMailer
  def new_assignment_email
    @assignment = params[:assignment]

    mail(
      to: @assignment.assignee.email,
      subject: "You have a new assignment on Reflet",
      from: "#{@assignment.assigner} <notifications@reflet.io>"
    )
  end
end
