class Questionnaire < ApplicationRecord
  include Assignable

  has_many :questions, dependent: :destroy
  has_many :assignments, as: :assignable, dependent: :destroy

  before_save :generate_slug

  def to_param
    slug
  end

  def completed?
    completed_at.present?
  end

  def unanswered_questions(assignment)
    questions.where.not(id: assignment.responses.select(:question_id))
  end

  private

  def generate_slug
    self.slug = abbreviation.parameterize
  end
end
