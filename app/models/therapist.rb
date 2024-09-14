class Therapist < User
  has_many :therapies, foreign_key: :therapist_id
  has_many :clients, -> { distinct }, through: :therapies, source: :client
end
