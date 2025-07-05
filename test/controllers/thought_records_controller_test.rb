require "test_helper"

class ThoughtRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thought_record = thought_records(:thought_record)
    sign_in @individual
  end

  test "should get index" do
    get thought_records_url
    assert_response :success
  end

  test "should get new" do
    get new_thought_record_url
    assert_response :success
  end

  test "should create thought_record" do
    assert_difference("ThoughtRecord.count") do
      post thought_records_url, params: { thought_record: { title: "Feeling Low", content: "Just a test!" } }
    end

    assert_redirected_to thought_record_url(ThoughtRecord.last)
  end

  test "should show thought_record" do
    get thought_record_url(@thought_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_thought_record_url(@thought_record)
    assert_response :success
  end

  test "should update thought_record" do
    patch thought_record_url(@thought_record), params: { thought_record: { title: "Updated Title", content: "Just a test!" } }
    assert_redirected_to thought_record_url(@thought_record)
  end

  test "should destroy thought_record" do
    assert_difference("ThoughtRecord.count", -1) do
      delete thought_record_url(@thought_record)
    end

    assert_redirected_to thought_records_url
  end
end
