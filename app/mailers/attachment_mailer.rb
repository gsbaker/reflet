class AttachmentMailer < ApplicationMailer
  def new_attachment_email
    @shareer = params[:shareer]
    @sharee = params[:sharee]
    @therapy = params[:therapy]

    mail(
      to: @sharee.email,
      subject: "Shared a file via Reflet",
      from: "#{@shareer} <notifications@reflet.io>"
    )
  end
end
