module Therapies
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :set_therapy

    layout "therapy"

    def set_therapy
      @therapy = current_user.therapies.find params[:therapy_id]
    end
  end
end
