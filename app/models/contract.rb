# frozen_string_literal: true

class Contract < ApplicationRecord
  belongs_to :therapist
  has_rich_text :content
  validates :title, :content, presence: true

  def to_s
    title
  end
end
