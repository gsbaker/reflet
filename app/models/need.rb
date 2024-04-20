class Need < ApplicationRecord
  has_many :ratings

  def to_s
    title
  end
end
