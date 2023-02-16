class NeedStatus
  belongs_to :user
  belongs_to :need

  enum status: { unknown: 0, rare: 1, sometimes: 2, consistent: 3 }
end
