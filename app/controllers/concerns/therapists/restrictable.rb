module Therapists
  module Restrictable
    extend ActiveSupport::Concern

    included do
      before_action :redirect_clients
    end

    private

    def redirect_client
      redirect_to root_path unless current_user.therapist?
    end
  end
end
