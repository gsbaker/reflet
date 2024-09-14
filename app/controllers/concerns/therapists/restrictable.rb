module Therapists
  module Restrictable
    extend ActiveSupport::Concern

    included do
      before_action :redirect_individuals
    end

    def redirect_individuals
      redirect_to root_path unless current_user.therapist?
    end
  end
end
