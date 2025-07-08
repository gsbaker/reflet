require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    sign_in @therapist
    get new_session_url
    assert_response :success
    assert_nil session[:user_id]
  end
end
