class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def dashboard
    @needs_record = @user.needs_records.build if @user.is_a?(Individual)
    @invitation = @user.sent_invitations.build if @user.is_a?(Therapist)
    @therapies = @user.therapies.includes(:client) if @user.is_a?(Therapist)
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  def set_user
    @user = current_user
  end
end
