class Question < ApplicationRecord
  belongs_to :questionnaire, dependent: :destroy
  has_many :responses

  validates :title, presence: true

  def answered?
    response.present?
  end
end
