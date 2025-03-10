class NeedRating < ApplicationRecord
  belongs_to :needs_record, dependent: :destroy
  belongs_to :need, dependent: :destroy

  enum :status, [ :rare, :sometimes, :consistent ]

  validates :status, presence: true, on: :update

  scope :consistently_met, -> { where(status: :consistent) }
  scope :sometimes_met, -> { where(status: :sometimes) }
  scope :rarely_met, -> { where(status: :rare) }
end
