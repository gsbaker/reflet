class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
  end
end
