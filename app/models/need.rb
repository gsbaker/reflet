class Need < ApplicationRecord
  has_many :need_ratings

  def to_s
    title
  end
end
