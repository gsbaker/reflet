class UsersController < Clearance::UsersController
  before_action :require_login

  def show
    all_needs = current_user.needs.where.not(status: nil)
    individual_needs = all_needs.where(category: ["autonomy", "meaning", "play", "physical"])
    social_needs = all_needs.where(category: "connection")

    if individual_needs.size > 0
      @individual_needs = individual_needs
    end

    if social_needs.size > 0
      @social_needs = social_needs
    end
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
        @user.needs << Need.create(group: group, title: need)
      end
    end
  end
end
