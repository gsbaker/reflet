class ResourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_non_therapists

  def index
    @questionnaires = Questionnaire.all
  end

  def update
  end

  private

  def resources_params
    params.require(:resources).permit(attachments: [])
  end
end
