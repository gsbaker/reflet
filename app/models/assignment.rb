class Assignment < ApplicationRecord
  belongs_to :therapy
  belongs_to :assignable, polymorphic: true

  has_many :responses

  enum cadence: %i[no_repeat one_week two_weeks one_month]

  validates :cadence, presence: true

  after_initialize do
    self.cadence ||= :no_repeat
  end

  def self.humanized_cadence(cadence)
    {
      no_repeat: "Doesn't repeat",
      one_week: "Once per week",
      two_weeks: "Once every 2 weeks",
      one_month: "Once per month"
    }[cadence.to_sym]
  end

  def humanized_cadence
    self.class.humanized_cadence(cadence)
  end

  def open?
    questionnaire.present? && !completed?
  end

  def completed?
    if assignable.is_a?(Questionnaire)
      Assignments::QuestionnaireProgress.new(self).completed?
    else
      false
    end
  end
end
