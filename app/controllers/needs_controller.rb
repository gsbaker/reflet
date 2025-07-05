class NeedsController < ApplicationController
  before_action :set_need, only: %i[ show ]

  # GET /needs or /needs.json
  def index
    @needs = Need.all
  end

  # GET /needs/1 or /needs/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_need
      @need = Need.find(params[:id])
    end
end
