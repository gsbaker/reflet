class User < ApplicationRecord
  include Clearance::User
  has_many :ratings, dependent: :destroy

  validates :name, presence: true

  def blank_slate?
    ratings.unknown.count == ratings.count
  end
end
