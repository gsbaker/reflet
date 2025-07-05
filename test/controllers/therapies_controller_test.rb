require "test_helper"

class TherapiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @therapy = therapies(:therapy)
    sign_in @therapist
  end

  test "should get index" do
    get therapies_url
    assert_response :success
  end

  test "should get new" do
    get new_therapy_url
    assert_response :success
  end

  test "should show therapy" do
    get therapy_url(@therapy)
    assert_redirected_to therapy_notes_url(@therapy)
  end

  test "should get edit" do
    get edit_therapy_url(@therapy)
    assert_response :success
  end

  test "should update therapy" do
    patch therapy_url(@therapy), params: { therapy: { completed_at: DateTime.now } }
    assert_redirected_to therapy_url(@therapy)
  end
end
