require "test_helper"

class NeedRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @need_rating = need_ratings(:need_rating)
    sign_in @individual
  end

  test "should update rating" do
    patch need_rating_url(@need_rating), params: { need_rating: { status: "rare" } }
    assert_redirected_to needs_record_url(@need_rating.needs_record)
  end
end
