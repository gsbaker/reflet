class Report < ApplicationRecord
  belongs_to :user
  has_many :ratings

  scope :latest, -> { order(created_at: :desc) }

  after_initialize do
    Need.all.each do |need|
      ratings.find_or_initialize_by need:
    end
  end

  def to_s
    "Report #{created_at.strftime('%Y-%m-%d')}"
  end

  def started?
    ratings.rated.exists?
  end

  def completed?
    ratings.unrated.none?
  end
end
