class NeedRating < ApplicationRecord
  belongs_to :needs_record, dependent: :destroy
  belongs_to :need, dependent: :destroy

  enum status: %i[rare sometimes consistent]

  validates :status, presence: true, on: :update
end
