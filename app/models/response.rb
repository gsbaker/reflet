class Response < ApplicationRecord
  belongs_to :question
  belongs_to :assignment

  validates :content, presence: true
end
