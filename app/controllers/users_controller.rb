class UsersController < Clearance::UsersController
  before_action :require_login, only: [:show]

  def show
    @user = current_user
  end

  def dashboard
    @user = current_user
    @needs = Need.all
  end

  def create
    @user = user_from_params

    if @user.save
      create_ratings(@user)
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new", status: :unprocessable_entity
    end
  end

  private

  def create_ratings(user)
    Need.all.each do |need|
      Rating.create(user: user, need: need, status: :unknown)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
