require "test_helper"

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:contract)
  end

  test "should get index" do
    sign_in @therapist
    get contracts_url
    assert_response :success
    assert_includes response.body, @contract.title
  end

  test "should not get index for individuals" do
    sign_in @individual
    get contracts_url
    assert_redirected_to root_url
  end

  test "should only show contracts belonging to current user" do
    sign_in @other_therapist
    get contracts_url
    assert_response :success
    assert_not_includes response.body, @contract.title
  end

  test "should get new" do
    sign_in @therapist
    get new_contract_url
    assert_response :success
  end

  test "should not get new for individuals" do
    sign_in @individual
    get new_contract_url
    assert_redirected_to root_url
  end

  test "should create contract" do
    sign_in @therapist
    assert_difference("Contract.count") do
      post contracts_url, params: { contract: { title: "Couchy Talkerson's Contract", content: "Test" } }
    end

    assert_redirected_to contract_url(Contract.last)
  end

  test "should not create contract for individual" do
    sign_in @individual
    assert_no_difference("Contract.count") do
      post contracts_url, params: { contract: { title: "Individual's Contract", content: "Test" } }
    end

    assert_redirected_to root_url
  end

  test "should not create contract with duplicate title" do
    @therapist.contracts.create(title: "Unique Title", content: "Just a test!")

    sign_in @therapist
    assert_no_difference("Contract.count") do
      post contracts_url, params: { contract: { title: "Unique Title", content: "Some content" } }
    end

    assert_response :unprocessable_entity
  end

  test "should show contract" do
    sign_in @therapist
    get contract_url(@contract)
    assert_response :success
  end

  test "should not show contract to individual" do
    sign_in @individual
    get contract_url(@contract)
    assert_redirected_to root_url
  end

  test "should get edit" do
    sign_in @therapist
    get edit_contract_url(@contract)
    assert_response :success
  end

  test "should not get edit for individual" do
    sign_in @individual
    get edit_contract_url(@contract)
    assert_redirected_to root_url
  end

  test "should not get edit for other therapist" do
    sign_in @other_therapist
    get edit_contract_url(@contract)
    assert_response :not_found
  end

  test "should update contract" do
    sign_in @therapist
    patch contract_url(@contract), params: { contract: { title: "Updated Title", content: "Updated content" } }
    assert_redirected_to contract_url(@contract)
  end

  test "should not update contract for individual" do
    sign_in @individual
    patch contract_url(@contract), params: { contract: { title: "Updated Title", content: "Updated content" } }
    assert_redirected_to root_url
  end

  test "should not update contract for other therapist" do
    sign_in @other_therapist
    patch contract_url(@contract), params: { contract: { title: "Updated Title", content: "Updated content" } }
    assert_response :not_found
  end

  test "should destroy contract" do
    sign_in @therapist
    assert_difference("Contract.count", -1) do
      delete contract_url(@contract)
    end

    assert_redirected_to contracts_url
  end
end
