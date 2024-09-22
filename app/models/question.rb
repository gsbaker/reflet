class Question < ApplicationRecord
  belongs_to :questionnaire, dependent: :destroy
  has_many :responses

  serialize :response_options, JSON

  validates :title, presence: true

  def answered?
    response.present?
  end
end
