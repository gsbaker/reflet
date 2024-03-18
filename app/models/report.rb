class Report < ApplicationRecord
  belongs_to :user
  has_many :ratings

  after_initialize do
    Need.all.each do |need|
      ratings.find_or_initialize_by need:
    end
  end
end
