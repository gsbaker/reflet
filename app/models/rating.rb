class Rating < ApplicationRecord
  belongs_to :needs_record, dependent: :destroy
  belongs_to :need, dependent: :destroy

  scope :rated, -> { where.not(title: nil) }
  scope :unrated, -> { where(title: nil) }

  RATINGS = ["Rarely Met", "Sometimes Met", "Consistently Met"].freeze
  validates :title, inclusion: { in: RATINGS }, allow_nil: true

  after_save :update_needs_record_status

  private

  def update_needs_record_status
    if needs_record.status == "Not started"
      needs_record.update status: "Started"
    elsif needs_record.status == "Started" && needs_record.completed?
      needs_record.update status: "Completed"
    end
  end
end
