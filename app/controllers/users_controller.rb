class UsersController < Clearance::UsersController
  def show
  end

  def create
    @user = user_from_params

    if @user.save
      create_needs
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new", status: :unprocessable_entity
    end
  end

  private

  def create_needs
    needs_data = YAML.load_file('needs.yml')

    needs_data.each do |group, needs|
      needs.each do |need|
        byebug
        @user.needs << Need.create(group: group, title: need)
      end
    end
  end
end
