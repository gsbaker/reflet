class NeedsRecord < ApplicationRecord
  include ActiveModel::Dirty

  belongs_to :individual, foreign_key: "user_id", class_name: "User"
  has_many :needs, dependent: :destroy
  has_many :ratings

  scope :latest, -> { order(created_at: :desc) }

  STATUSES = ["Not started", "Started", "Completed"].freeze

  validates :status, inclusion: { in: STATUSES }

  after_initialize do
    initialize_needs
    initialize_status
  end

  before_save :update_completed_at

  def to_s
    "Needs #{created_at.strftime('%Y-%m-%d')} (#{status.downcase})"
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

  def update_completed_at
    self.completed_at = Time.current if completed?
  end
end
