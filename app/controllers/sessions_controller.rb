class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def new
  end

  def create
    if @user.present?
      login @user
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "You have been logged out."
  end

  private

  def authenticate_user
    @user = User.authenticate_by(email: params[:email], password: params[:password])
  end
end
