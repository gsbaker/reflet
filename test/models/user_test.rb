require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "therapist is a therapist" do
    assert @therapist.therapist?
  end

  test "therapist is not an individual" do
    assert_not @therapist.individual?
  end

  test "individual is an individual" do
    assert @individual.individual?
  end

  test "individual is not a therapist" do
    assert_not @individual.therapist?
  end

  test "individual is a client" do
    assert @individual.client?
  end

  test "individual without therapies is not a client" do
    non_client = users(:non_client)
    assert_not non_client.client?
  end

  test "to_s returns name" do
    assert @therapist.to_s, @therapist.name
  end
end
