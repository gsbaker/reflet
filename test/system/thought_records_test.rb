require "application_system_test_case"

class ThoughtRecordsTest < ApplicationSystemTestCase
  setup do
    @thought_record = thought_records(:one)
  end

  test "visiting the index" do
    visit thought_records_url
    assert_selector "h1", text: "Thought records"
  end

  test "should create thought record" do
    visit thought_records_url
    click_on "New thought record"

    fill_in "Alternative feelings", with: @thought_record.alternative_feelings
    fill_in "Alternative thoughts", with: @thought_record.alternative_thoughts
    click_on "Create Thought record"

    assert_text "Thought record was successfully created"
    click_on "Back"
  end

  test "should update Thought record" do
    visit thought_record_url(@thought_record)
    click_on "Edit this thought record", match: :first

    fill_in "Alternative feelings", with: @thought_record.alternative_feelings
    fill_in "Alternative thoughts", with: @thought_record.alternative_thoughts
    click_on "Update Thought record"

    assert_text "Thought record was successfully updated"
    click_on "Back"
  end

  test "should destroy Thought record" do
    visit thought_record_url(@thought_record)
    click_on "Destroy this thought record", match: :first

    assert_text "Thought record was successfully destroyed"
  end
end
