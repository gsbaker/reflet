class ResourcesController < ApplicationController
  include Therapists::Restrictable

  before_action :authenticate_user!

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
