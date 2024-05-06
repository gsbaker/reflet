require "test_helper"

class TherapiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @therapy = therapies(:one)
  end

  test "should get index" do
    get therapies_url
    assert_response :success
  end

  test "should get new" do
    get new_therapy_url
    assert_response :success
  end

  test "should create therapy" do
    assert_difference("Therapy.count") do
      post therapies_url, params: { therapy: { completed_at: @therapy.completed_at, started_at: @therapy.started_at, therapist_id: @therapy.therapist_id, user_id: @therapy.user_id } }
    end

    assert_redirected_to therapy_url(Therapy.last)
  end

  test "should show therapy" do
    get therapy_url(@therapy)
    assert_response :success
  end

  test "should get edit" do
    get edit_therapy_url(@therapy)
    assert_response :success
  end

  test "should update therapy" do
    patch therapy_url(@therapy), params: { therapy: { completed_at: @therapy.completed_at, started_at: @therapy.started_at, therapist_id: @therapy.therapist_id, user_id: @therapy.user_id } }
    assert_redirected_to therapy_url(@therapy)
  end

  test "should destroy therapy" do
    assert_difference("Therapy.count", -1) do
      delete therapy_url(@therapy)
    end

    assert_redirected_to therapies_url
  end
end
