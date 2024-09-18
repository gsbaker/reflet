class Questionnaire < ApplicationRecord
  has_many :questions
  has_many :assignments, as: :assignable

  validates :title, presence: true, uniqueness: true

  before_save :generate_slug
  before_update :mark_completed

  def to_param
    slug
  end

  def completed?
    completed_at.present?
  end

  private

  def generate_slug
    self.slug = title.parameterize
  end

  def mark_completed
    self.completed_at ||= Time.zone.now if questions.all?(&:answered?)
  end
end
