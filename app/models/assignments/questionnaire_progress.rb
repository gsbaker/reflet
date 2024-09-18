module Assignments
  class QuestionnaireProgress
    attr_reader :assignment

    def initialize(assignment)
      @assignment = assignment
    end

    def open?
      !completed?
    end

    def completed?
      total_questions = assignment.assignable.questions.count
      answered_questions = responses.where(question_id: assignment.assignable.questions.pluck(:id)).count

      total_questions == answered_questions
    end
  end
end
