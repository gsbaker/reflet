class ThoughtRecord < ApplicationRecord
  has_rich_text :content, encrypted: true

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :author, foreign_key: "user_id", class_name: "User"
  belongs_to :therapy, optional: true

  def to_s
    title
  end
end
