class Therapy < ApplicationRecord
  include ActiveModel::Dirty

  has_many_attached :attachments
  after_update :assign_uploaded_by, if: -> { attachments.attached? }

  belongs_to :client, class_name: "Individual", foreign_key: "individual_id"
  belongs_to :therapist, class_name: "Therapist"

  has_many :assignments
  has_many :notes
  has_many :needs_records
  has_many :thought_records

  scope :active, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  def started_date
    created_at.to_date.to_fs(:long)
  end

  def completed_date
    return if completed_at.nil?

    completed_at.to_date.to_fs(:long)
  end

  def counterpart(user)
    case user
    when Individual
      therapist
    when Therapist
      client
    end
  end

  def notes_by_month
    notes.order(date: :desc).group_by { |note| note.date.strftime("%B") }
  end

  def completed_assignments_by_month
    assignments.completed.order(completed_at: :desc).group_by { |assignment| assignment.completed_at.strftime("%B") }
  end

  def mark_completed
    update completed_at: DateTime.current
  end

  def mark_active
    update completed_at: nil
  end

  private

  def assign_uploaded_by
    attachments.each do |attachment|
      attachment.update uploaded_by_id: Current.user.id if attachment.uploaded_by_id.nil?
    end
  end
end
