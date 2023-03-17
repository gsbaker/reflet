class NeedsController < ApplicationController
  before_action :require_login

  def index
    @need = current_user.needs.unknown.first
  end

  def show
    @need = current_user.needs.find params[:id]
  end

  def update
    @need = current_user.needs.find params[:id]
    @need.update(status: needs_params[:status])

    @need = current_user.needs.unknown.first

    respond_to do |format|
      format.turbo_stream do
        render
      end
    end
  end

  def needs_params
    params.require(:need).permit(:status)
  end
end
