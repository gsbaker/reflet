class Note < ApplicationRecord
  belongs_to :therapy

  has_rich_text :content

  validates :content, presence: true
  validates :date, presence: true
  validates :title, presence: true
end
