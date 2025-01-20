# frozen_string_literal: true

module Therapies
  class NeedsRecordsController < BaseController
    def index
      @needs_records = @therapy.needs_records
    end

    def show
      @needs_record = @therapy.needs_records.find params[:id]
    end
  end
end
