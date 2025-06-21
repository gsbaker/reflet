class Assignment < ApplicationRecord
  belongs_to :therapy
  has_one :assignee, through: :therapy, source: :client
  has_one :assigner, through: :therapy, source: :therapist

  belongs_to :assignable, polymorphic: true

  has_many :responses

  enum :cadence, %i[no_repeat one_week two_weeks one_month]

  validates :cadence, presence: true
  validates :assignable, presence: true

  validate :validate_no_duplicate_open_assignments

  scope :open, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  after_create :schedule_recurring_assignment, unless: -> { no_repeat? }

  after_initialize do
    self.cadence ||= :no_repeat
  end

  def to_s
    assignable.title
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
    assignable.present? && !completed?
  end

  def completed?
    assignable.questions.count == responses.count
  end

  def mark_completed
    return unless completed? && completed_at.nil?

    update(completed_at: DateTime.current)
  end

  private

  def validate_no_duplicate_open_assignments
    existing_assignment = assignee.assignments.open.find_by(assignable:)

    return unless existing_assignment.present? && existing_assignment.responses.empty?

    errors.add(:base, "#{assignee.name} already has an assignment for #{assignable.title} which they haven't started")
  end

  def schedule_recurring_assignment
    RecurAssignmentJob.set(wait_until: next_recurs).perform_later(self)
  end

  def next_recurs
    case cadence
    when "one_week"
      1.week.from_now
    when "two_weeks"
      2.weeks.from_now
    when "one_month"
      1.month.from_now
    end
  end
end
