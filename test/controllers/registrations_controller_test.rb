require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    sign_in @therapist
    get new_registration_url
    assert_response :success
    assert_nil session[:user_id]
  end
end
