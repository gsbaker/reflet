class ThoughtRecord < ApplicationRecord
  has_rich_text :situation, encrypted: true
  has_rich_text :feelings, encrypted: true
  has_rich_text :thoughts, encrypted: true
  has_rich_text :evidence_for, encrypted: true
  has_rich_text :evidence_against, encrypted: true
  has_rich_text :alternative_thoughts, encrypted: true
  has_rich_text :alternative_feelings, encrypted: true

  validates :situation, presence: true
  validates :feelings, presence: true
  validates :thoughts, presence: true
  validates :evidence_for, presence: true
  validates :evidence_against, presence: true

  validates :title, presence: true

  belongs_to :individual, foreign_key: "user_id", class_name: "User"

  def to_s
    title
  end
end
