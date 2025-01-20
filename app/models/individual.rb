class Individual < User
  has_many :needs_records, foreign_key: :user_id, dependent: :destroy
  has_many :thought_records, foreign_key: :user_id, dependent: :destroy
  has_many :therapies, foreign_key: :individual_id
  has_many :therapists, through: :therapies
  has_many :assignments, through: :therapies

  def latest_needs_record
    needs_records.latest.first
  end

  def self.model_name
    User.model_name
  end
end
