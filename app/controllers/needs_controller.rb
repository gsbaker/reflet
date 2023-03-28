class NeedsController < ApplicationController
  before_action :require_login

  def index
    @needs = Need.all
  end

  def show
    @need = current_user.needs.find params[:id]
  end

end
