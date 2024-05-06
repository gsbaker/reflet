class Therapy < ApplicationRecord
  belongs_to :user
  belongs_to :therapist, class_name: "User"
end
