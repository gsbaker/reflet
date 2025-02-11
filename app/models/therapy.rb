class Therapy < ApplicationRecord
  include ActiveModel::Dirty

  has_many_attached :attachments
  after_update :assign_uploaded_by, if: -> { attachments.attached? }

  belongs_to :client, class_name: "Individual", foreign_key: "individual_id"
  belongs_to :therapist, class_name: "Therapist", foreign_key: "therapist_id"

  has_many :assignments
  has_many :notes
  has_many :needs_records
  has_many :thought_records

  validates :started_at, presence: true

  after_initialize do
    self.started_at ||= DateTime.current
  end

  def started_date
    started_at.to_date.to_fs(:long)
  end

  def counterpart(user)
    case user
    when Individual
      therapist
    when Therapist
      client
    end
  end

  private

  def assign_uploaded_by
    attachments.each do |attachment|
      attachment.update uploaded_by_id: Current.user.id if attachment.uploaded_by_id.nil?
    end
  end
end
