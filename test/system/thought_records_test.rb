require "application_system_test_case"

class ThoughtRecordsTest < ApplicationSystemTestCase
  setup do
    @thought_record = thought_records(:thought_record)
    sign_in "client@reflet.io"
  end

  test "visiting the index" do
    visit thought_records_url
    assert_selector "h1", text: "Thought Records"
  end

  test "should create thought record" do
    visit thought_records_url
    click_on "Create a thought record"

    fill_in "thought_record_title", with: "Feeling low"
    fill_in_rich_text_area "thought_record_content", with: "I feel low because I failed an exam."

    click_on "Create thought record"

    assert_text "Thought record was successfully created"
    assert_selector "h1", text: "Feeling low"
  end

  test "should update thought record" do
    visit thought_record_url(@thought_record)
    click_on "Edit", match: :first

    fill_in "thought_record_title", with: "Updated thought record"
    fill_in_rich_text_area "thought_record_content", with: "Updated content for the thought record."

    click_on "Update thought record"

    assert_text "Thought record was successfully updated"
    assert_selector "h1", text: "Updated thought record"
  end

  test "should destroy Thought record" do
    visit thought_record_url(@thought_record)

    accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Thought record was successfully destroyed"
  end
end
