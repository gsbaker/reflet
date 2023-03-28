class Need < ApplicationRecord
  scope :autonomy, -> { where(category: 'autonomy') }
  has_many :ratings, dependent: :destroy
end
