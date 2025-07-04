require "test_helper"

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @individual = users(:individual)
    @therapist = users(:therapist)
    @questionnaire = questionnaires(:questionnaire)
  end

  test "therapist can access show page" do
    sign_in @therapist
    get questionnaire_url @questionnaire.slug
    assert_response :success
    assert_select "h1", @questionnaire.title
  end

  test "individual gets redirected from show page" do
    sign_in @individual
    get questionnaire_url @questionnaire.slug
    assert_redirected_to root_path
  end
end
