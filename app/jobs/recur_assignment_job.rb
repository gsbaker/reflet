class RecurAssignmentJob < ApplicationJob
  queue_as :default

  def perform(assignment)
    return if assignment.no_repeat?

    Assignment.create(
      therapy: assignment.therapy,
      assignable: assignment.assignable,
      cadence: assignment.cadence
    )
  end
end
