require "active_support/concern"

module Logoutable
  extend ActiveSupport::Concern

  included do
    before_action :logout, only: :new, if: :user_signed_in?
  end
end
