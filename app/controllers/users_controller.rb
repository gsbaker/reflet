class UsersController < Clearance::UsersController
  before_action :require_login, only: [:show]

  def show
    @needs = Need.all
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new", status: :unprocessable_entity
    end
  end
end
