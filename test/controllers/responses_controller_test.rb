require "test_helper"

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in @individual
    @question = questions(:question)
    @assignment = assignments(:assignment)
  end

  test "should create response" do
    assert_difference("Response.count") do
      post responses_url, params: { response: { content: "This is a test response.", score: 3, question_id: @question.id, assignment_id: @assignment.id } }
    end

    assert_redirected_to assignment_path(@assignment)
  end
end
