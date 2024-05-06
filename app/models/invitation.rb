class Invitation < ApplicationRecord
  belongs_to :therapist, class_name: "User"
  belongs_to :user

  enum status: { sent: "sent", accepted: "accepted", declined: "declined" }

  validates :status, presence: true
end
