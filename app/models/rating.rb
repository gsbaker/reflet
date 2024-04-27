class Rating < ApplicationRecord
  belongs_to :report, dependent: :destroy
  belongs_to :need, dependent: :destroy

  scope :rated, -> { where.not(title: nil) }
  scope :unrated, -> { where(title: nil) }

  RATINGS = ["Rarely Met", "Sometimes Met", "Consistently Met"].freeze
  validates :title, inclusion: { in: RATINGS }, allow_nil: true

  after_save :update_report_status

  private

  def update_report_status
    if report.status == "Not started"
      report.update status: "Started"
    elsif report.status == "Started" && report.completed?
      report.update status: "Completed"
    end
  end
end
