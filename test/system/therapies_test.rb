require "application_system_test_case"

class TherapiesTest < ApplicationSystemTestCase
  setup do
    @therapy = therapies(:one)
  end

  test "visiting the index" do
    visit therapies_url
    assert_selector "h1", text: "Therapies"
  end

  test "should create therapy" do
    visit therapies_url
    click_on "New therapy"

    fill_in "Completed at", with: @therapy.completed_at
    fill_in "Started at", with: @therapy.started_at
    fill_in "Therapist", with: @therapy.therapist_id
    fill_in "User", with: @therapy.user_id
    click_on "Create Therapy"

    assert_text "Therapy was successfully created"
    click_on "Back"
  end

  test "should update Therapy" do
    visit therapy_url(@therapy)
    click_on "Edit this therapy", match: :first

    fill_in "Completed at", with: @therapy.completed_at
    fill_in "Started at", with: @therapy.started_at
    fill_in "Therapist", with: @therapy.therapist_id
    fill_in "User", with: @therapy.user_id
    click_on "Update Therapy"

    assert_text "Therapy was successfully updated"
    click_on "Back"
  end

  test "should destroy Therapy" do
    visit therapy_url(@therapy)
    click_on "Destroy this therapy", match: :first

    assert_text "Therapy was successfully destroyed"
  end
end
