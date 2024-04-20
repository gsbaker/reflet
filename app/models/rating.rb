class Rating < ApplicationRecord
  belongs_to :report
  belongs_to :need

  scope :rated, -> { where.not(title: nil) }
  scope :unrated, -> { where(title: nil) }

  RATINGS = ["Rarely Met", "Sometimes Met", "Consistently Met"].freeze
  validates :title, inclusion: { in: RATINGS }, allow_nil: true
end
