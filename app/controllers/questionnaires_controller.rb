class QuestionnairesController < ApplicationController
  include Therapists::Restrictable

  before_action :authenticate_user!
  before_action :set_questionnaire, only: [:show]

  def show
    @assignment = @questionnaire.assignments.build assignable: @questionnaire
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find_by!(slug: params[:slug])
  end
end
