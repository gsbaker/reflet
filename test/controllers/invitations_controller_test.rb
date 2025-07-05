require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invitation = invitations(:received_sent_invitation)
    sign_in @therapist
  end

  test "should get index" do
    get invitations_url
    assert_response :success
  end

  test "should get new" do
    get new_invitation_url
    assert_response :success
  end

  test "should create invitation" do
    assert_difference("Invitation.count") do
      post invitations_url, params: { invitation: { email: "test@reflet.io" } }
    end

    assert_redirected_to root_url
  end

  test "should show invitation" do
    get invitation_url(@invitation)
    assert_response :success
  end

  test "should destroy invitation" do
    assert_difference("Invitation.count", -1) do
      delete invitation_url(@invitation)
    end

    assert_redirected_to invitations_url
  end
end
