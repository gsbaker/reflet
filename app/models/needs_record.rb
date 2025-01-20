class NeedsRecord < ApplicationRecord
  include ActiveModel::Dirty

  belongs_to :individual, foreign_key: "user_id", class_name: "User"

  has_many :needs, dependent: :destroy
  has_many :ratings, class_name: "NeedRating"
  belongs_to :therapy, optional: true

  scope :latest, -> { order(created_at: :desc) }

  enum :status, %i[in_progress completed]

  after_initialize do
    initialize_ratings
  end

  before_update :mark_completed, if: -> { status_changed? && completed? }

  def to_s
    return "Needs Record" unless persisted?

    "Needs Record #{created_at.strftime('%Y-%m-%d')} (#{status.humanize})"
  end

  def in_progress?
    status == "in_progress"
  end

  def completed?
    status == "completed"
  end

  private

  def initialize_ratings
    Need.all.each do |need|
      ratings.find_or_initialize_by need:
    end
  end

  def mark_completed
    self.completed_at = Time.current
  end
end
