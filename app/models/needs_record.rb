class NeedsRecord < ApplicationRecord
  include ActiveModel::Dirty

  belongs_to :individual, foreign_key: "user_id", class_name: "User"

  has_many :needs, dependent: :destroy
  has_many :ratings, class_name: "NeedRating"
  belongs_to :therapy, optional: true

  scope :latest, -> { order(created_at: :desc) }

  enum :status, [ :in_progress, :completed ]

  validates :title, presence: true

  before_create { create_ratings }

  before_update :mark_completed, if: -> { status_changed? && completed? }

  def to_s
    return "Needs Record" if new_record?

    title
  end

  def ratings_by_status
    @ratings_by_status ||= ratings.includes(:need).group_by(&:status)
  end

  def consistent_needs
    ratings_by_status["consistent"]
  end

  def sometimes_needs
    ratings_by_status["sometimes"]
  end

  def rare_needs
    ratings_by_status["rare"]
  end

  private

  def create_ratings
    Need.all.each do |need|
      ratings.find_or_initialize_by need:
    end
  end

  def mark_completed
    self.completed_at = Time.current
  end
end
