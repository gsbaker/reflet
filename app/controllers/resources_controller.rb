class ResourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_non_therapists

  def index
    @questionnaires = Questionnaire.all
  end
end
