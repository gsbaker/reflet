# frozen_string_literal: true

class Contract < ApplicationRecord
  belongs_to :therapist
  has_rich_text :content

  validates :title, presence: true, uniqueness: { scope: :therapist_id }
  validates :therapist, :content, presence: true

  def to_s
    title
  end
end
