class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[show edit destroy accept decline]

  # GET /invitations or /invitations.json
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1 or /invitations/1.json
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations or /invitations.json
  def create
    invitee_from_email = User.find_by_email(invitation_params[:email])

    if invitee_from_email.present?
      create_invitation_for_existing_invitee(user_from_email)
    else
      send_invitation_email(invitation_params[:email])
    end
  end

  def create_invitation_for_existing_invitee(invitee)
    @invitation = current_user.sent_invitations.build(invitee:)

    if @invitation.save
      redirect_to @invitation, notice: "Invitation sent to #{@invitation.email_for_invitee}."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def send_invitation_email(email)
    @invitation = current_user.sent_invitations.build(invitee_email: email)

    if @invitation.save
      InvitationMailer.with(invitation: @invitation).invitation_email.deliver_later
      redirect_to @invitation, notice: "Invitation sent to #{email}."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /invitations/1 or /invitations/1.json
  def destroy
    @invitation.destroy!

    respond_to do |format|
      format.html { redirect_to invitations_url, notice: "Invitation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def accept
    @invitation.accept

    redirect_to therapies_path, notice: "Invitation accepted."
  end

  def decline
    @invitation = Invitation.find(params[:id])
    @invitation.update!(status: :declined)

    redirect_to therapies_path, notice: "Invitation declined."
  end

  private

  def build_invitation_from_email
    user_from_email = User.find_by_email(invitation_params[:email])

    if user_from_email.present?
      current_user.sent_invitations.build(invitee: user_from_email)
    else
      current_user.sent_invitations.build(invitee_email: invitation_params[:email])
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
