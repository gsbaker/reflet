module Assignable
  extend ActiveSupport::Concern

  included do
    validates :title, presence: true, uniqueness: true
  end
end
