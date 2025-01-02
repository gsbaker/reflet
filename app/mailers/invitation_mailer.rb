class InvitationMailer < ApplicationMailer
  def invite
    @invitation = params[:invitation]
    mail to: @invitation.invitee_email, subject: "#{@invitation.inviter.name} has invited you to join Reflet"
  end
end
