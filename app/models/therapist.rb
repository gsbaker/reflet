class Therapist < User
  has_many :therapies
  has_many :clients, through: :therapies, source: :user
end
