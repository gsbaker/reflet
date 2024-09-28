# frozen_string_literal: true

module Therapies
  class NeedsRecordsController < ApplicationController
    before_action :set_therapy, only: [:show]

    def show
      @needs_record = @therapy.needs_records.find params[:id]
    end

    private

    def set_therapy
      @therapy = current_user.therapies.find params[:therapy_id]
    end
  end
end
