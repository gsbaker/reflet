module Therapies
  class ThoughtRecordsController < BaseController
    def index
      @thought_records = @therapy.thought_records
    end
    
    def show
      @thought_record = @therapy.thought_records.find params[:id]
    end
  end
end
