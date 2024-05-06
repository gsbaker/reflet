class Individual < User
  has_many :needs_records, foreign_key: :user_id, dependent: :destroy
  has_many :thought_records, foreign_key: :user_id, dependent: :destroy
  has_many :therapies
  has_many :therapists, through: :therapies

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

  def self.model_name
    User.model_name
  end
end
