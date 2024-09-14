class Therapy < ApplicationRecord
  include ActiveModel::Dirty

  has_many_attached :attachments
  before_update :assign_uploaded_by, if: -> { attachments.attached? }

  belongs_to :client, class_name: "Individual", foreign_key: "individual_id"
  belongs_to :therapist, class_name: "Therapist", foreign_key: "therapist_id"

  validates :started_at, presence: true

  after_initialize do
    self.started_at ||= DateTime.current
  end

  def started_date
    started_at.to_date.to_fs(:long)
  end

  private

  def assign_uploaded_by
    attachments.each do |attachment|
      attachment.uploaded_by_id ||= current_user.id
    end
  end
end
