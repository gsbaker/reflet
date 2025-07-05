require "test_helper"

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in @therapist
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end
end
