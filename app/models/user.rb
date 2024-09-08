class User < ApplicationRecord
  self.inheritance_column = :type

  has_secure_password

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.downcase }

  validates :name, presence: true

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  generates_token_for :email_confirmation, expires_in: 1.day do
    email
  end

  has_many :sent_invitations, class_name: "Invitation", foreign_key: :inviter_id
  has_many :received_invitations, class_name: "Invitation", foreign_key: :invitee_id

  def to_s
    name
  end

  def pending_invitations
    received_invitations.where(status: :sent)
  end
end
