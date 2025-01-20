module Therapies
  class AttachmentsController < BaseController
    def index
      @attachments = @therapy.attachments
    end

    def create
      @therapy.assign_attributes(therapy_params)

      @therapy.attachments.each do |attachment|
        attachment.uploaded_by_id ||= current_user.id
      end

      respond_to do |format|
        if @therapy.save
          turbo_stream.replace "attachments-table" do
            render partial: "table", locals: { attachments: @therapy.attachments }
          end
        else
          render :show, status: :unprocessable_entity
        end
      end
    end

    private

    def therapy_params
      params.require(:therapy).permit(attachments: [])
    end
  end
end
