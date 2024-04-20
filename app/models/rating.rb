class Rating < ApplicationRecord
  belongs_to :report
  belongs_to :need

  AVAILABLE_RATINGS = [nil, "Rarely Met", "Sometimes Met", "Consistently Met"].freeze
  validates :title, inclusion: { in: AVAILABLE_RATINGS }

  def available_ratings
    AVAILABLE_RATINGS
  end
end
