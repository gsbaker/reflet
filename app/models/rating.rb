class Rating < ApplicationRecord
  belongs_to :report
  belongs_to :need

  scope :rated, -> { where.not(title: nil) }
  scope :unrated, -> { where(title: nil) }

  AVAILABLE_RATINGS = [nil, "Rarely Met", "Sometimes Met", "Consistently Met"].freeze
  validates :title, inclusion: { in: AVAILABLE_RATINGS }

  def available_ratings
    AVAILABLE_RATINGS
  end
end
