class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @report = current_user.reports.build
  end
end
