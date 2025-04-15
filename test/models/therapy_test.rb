require "test_helper"

class TherapyTest < ActiveSupport::TestCase
  setup do
    @individual = users(:individual)
    @therapist = users(:therapist)
  end

  test "mark_completed should set completed_at to current date" do
    therapy = Therapy.create!(client: @individual, therapist: @therapist)
    assert_nil therapy.completed_at

    therapy.mark_completed
    assert_equal DateTime.current.to_date, therapy.completed_at.to_date
  end
end
