class InvitationMailer < ApplicationMailer
  def invite
    @invitation = params[:invitation]
    mail to: @invitation.invitee_email, subject: "#{@invitation.inviter.name} has invited you to join Reflet"
  end

  def accept
    @invitation = params[:invitation]
    mail(
      to: @invitation.inviter.email,
      subject: "#{@invitation.invitee.name} has accepted your invitation"
    )
  end
end
