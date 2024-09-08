class Therapy < ApplicationRecord
  belongs_to :individual, class_name: "Individual", foreign_key: "individual_id"
  belongs_to :therapist, class_name: "Therapist", foreign_key: "therapist_id"

  validates :individual_id, presence: true
  validates :therapist_id, presence: true
end
