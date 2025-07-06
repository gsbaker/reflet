require "application_system_test_case"

class ContractsTest < ApplicationSystemTestCase
  setup do
    @contract = contracts(:contract)
    sign_in "therapist@reflet.io"
  end

  test "visiting the index" do
    visit contracts_url
    assert_selector "h1", text: "Contracts"
  end

  test "should create contract" do
    visit contracts_url
    click_on "Create a contract"

    fill_in "Title", with: "Just a test contract"
    fill_in_rich_text_area "contract_content", with: "This is a test therapy agreement."
    click_on "Create contract"

    assert_text "Contract was successfully created"
    assert_selector "h1", text: "Just a test contract"
  end

  test "should update Contract" do
    visit contract_url(@contract)
    click_on "Edit", match: :first

    fill_in "Title", with: "Edited contract"
    fill_in_rich_text_area "contract_content", with: "Edited contract content"
    click_on "Update this contract"

    assert_text "Contract was successfully updated"
    assert_selector "h1", text: "Edited contract"
  end

  test "should destroy Contract" do
    visit contract_url(@contract)

    accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Contract was successfully destroyed"
  end
end
