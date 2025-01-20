module Therapies
  class AssignmentsController < BaseController
    def index
      @assignments = @therapy.assignments
    end
  end
end
