class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @needs_record = current_user.needs_records.build
  end
end
