class RegistrationsController < ApplicationController
  def new
    @user = User.new

    load_invitation_defaults if params[:invitation_id].present?
  end

  def load_invitation_defaults
    @invitation = Invitation.find(params[:invitation_id])
    return unless @invitation.present?

    @user.email = @invitation.invitee_email
    case @invitation.inviter.type
    when "Individual"
      @user.type = "Therapist"
    when "Therapist"
      @user.type = "Individual"
    end
  end

  def create
    @user = User.new(registration_params)

    if @user.save
      set_up_therapy if params[:invitation_id].present?
      login @user
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :type
    )
  end

  def set_up_therapy
    @invitation = Invitation.find params[:invitation_id]
    case @invitation.inviter.type
    when "Individual"
      @user.therapies.find_or_create_by! client: @invitation.invitee
    when "Therapist"
      @user.therapies.find_or_create_by! therapist: @invitation.inviter
    end

    @invitation.update! status: :accepted
  end
end
