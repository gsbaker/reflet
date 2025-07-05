require "test_helper"

class NeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @need = needs(:need)
    sign_in @individual
  end

  test "should get index" do
    get needs_url
    assert_response :success
  end

  test "should show need" do
    get need_url(@need)
    assert_response :success
  end
end
