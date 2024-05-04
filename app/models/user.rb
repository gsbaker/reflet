class User < ApplicationRecord
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

  has_many :needs_records
  has_many :thought_records

  def to_s
    name
  end

  def latest_needs_record
    needs_records.latest.first
  end

  def can_create_needs_record?
    return true unless latest_needs_record

    latest_needs_record.completed? && latest_needs_record.created_at < 1.week.ago
  end

  def new_needs_record_available_in
    return false unless latest_needs_record&.completed?

    new_needs_record_date = latest_needs_record.completed_at.to_date + 1.week

    "#{(new_needs_record_date - Date.today).to_i} days"
  end
end
