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

  def gad7?
    slug == "gad-7"
  end

  def phq9?
    slug == "phq-9"
  end

  def score_in_words(score)
    if gad7?
      gad7_score_in_words(score)
    elsif phq9?
      phq9_score_in_words(score)
    else
      "Score not available for this questionnaire."
    end
  end

  private

  def generate_slug
    self.slug = abbreviation.parameterize
  end

  def gad7_score_in_words(score)
    case score
    when 0..4
      "Minimal Anxiety"
    when 5..9
      "Mild Anxiety"
    when 10..14
      "Moderate Anxiety"
    else
      "Severe Anxiety"
    end
  end

  def phq9_score_in_words(score)
    case score
    when 0..4
      "None/Minimal Depression"
    when 5..9
      "Mild Depression"
    when 10..14
      "Moderate Depression"
    when 15..19
      "Moderately Severe Depression"
    else
      "Severe Depression"
    end
  end
end
