class Invitation < ApplicationRecord
  belongs_to :inviter, class_name: "User"
  belongs_to :invitee, class_name: "User"

  enum status: { sent: "sent", accepted: "accepted", declined: "declined" }

  validates :status, presence: true
  validates :inviter_id, presence: true
  validates :invitee_id, presence: true
  validate :invitee_is_different_type_from_inviter, if: -> { invitee.present? }

  after_initialize :set_default_status, if: :new_record?

  def accept
    update!(status: :accepted)

    case inviter.type
    when "Individual"
      inviter.therapies.find_or_create_by!(therapist: invitee)
    when "Therapist"
      invitee.therapies.find_or_create_by!(therapist: inviter)
    end
  end

  private

  def set_default_status
    self.status = :sent
  end

  def invitee_is_different_type_from_inviter
    case inviter.type
    when "Individual"
      invitee_is_therapist
    when "Therapist"
      invitee_is_individual
    end
  end

  def invitee_is_therapist
    return if invitee.type == "Therapist"

    errors.add(:base, "#{invitee.email} is registered, but not as a therapist.")
  end

  def invitee_is_individual
    return if invitee.type == "Individual"

    errors.add(:base, "#{invitee.email} is registered as a therapist. New clients must be registered as individuals.")
  end
end
