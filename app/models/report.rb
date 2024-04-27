class Report < ApplicationRecord
  belongs_to :user
  has_many :ratings

  scope :latest, -> { order(created_at: :desc) }

  STATUSES = ["Not started", "Started", "Completed"].freeze

  validates :status, inclusion: { in: STATUSES }

  after_initialize do
    initialize_needs
    initialize_status
  end

  def to_s
    "Report #{created_at.strftime('%Y-%m-%d')} (#{status.downcase})"
  end

  def not_started?
    status == "Not started"
  end

  def started?
    ratings.rated.exists? && !completed?
  end

  def completed?
    ratings.unrated.none?
  end

  private

  def initialize_needs
    Need.all.each do |need|
      ratings.find_or_initialize_by need:
    end
  end

  def initialize_status
    self.status ||= "Not started"
  end
end
