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

  def latest_report
    reports.latest.first
  end

  def can_create_report?
    return true unless latest_report

    latest_report.completed? && latest_report.created_at < 1.week.ago
  end

  def new_report_available_in
    return false unless latest_report&.completed?

    new_report_date = latest_report.updated_at.to_date + 1.week

    "#{(new_report_date - Date.today).to_i} days"
  end
end
