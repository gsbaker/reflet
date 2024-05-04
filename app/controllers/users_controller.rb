class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  before_action :set_user

  def dashboard
    @needs_record = @user.needs_records.build
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = current_user
  end
end
