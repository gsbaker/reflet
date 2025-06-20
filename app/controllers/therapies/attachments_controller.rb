module Therapies
  class AttachmentsController < BaseController
    def index
      @attachments = @therapy.attachments
    end

    def create
      @therapy.assign_attributes(therapy_params)

      if @therapy.save
        notify_sharee

        redirect_to therapy_attachments_path(@therapy)
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def therapy_params
      params.require(:therapy).permit(attachments: [])
    end

    def notify_sharee
      AttachmentMailer
        .with(shareer: current_user, sharee: @therapy.counterpart(current_user), therapy: @therapy)
        .new_attachment_email
        .deliver_later
    end
  end
end
