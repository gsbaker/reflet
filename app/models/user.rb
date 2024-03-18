class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.downcase }

  validates :forename, presence: true
  validates :surname, presence: true

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  generates_token_for :email_confirmation, expires_in: 1.day do
    email
  end

  has_many :reports

  def display_name
    "#{forename} #{surname}"
  end
end
