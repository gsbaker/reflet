require "test_helper"

class ContractTest < ActiveSupport::TestCase
  setup do
    @therapist = users(:therapist)
  end

  test "contract must have a title" do
    contract = Contract.new(title: nil, therapist: @therapist, content: "Just a test!")
    assert contract.invalid?
  end

  test "one therapist cannot create multiple contracts with same title" do
    contract = Contract.create(title: "Therapy Contract", therapist: @therapist, content: "Just a test!")
    assert contract.valid?

    duplicate_contract = Contract.new(title: "Therapy Contract", therapist: @therapist, content: "Another test!")
    assert duplicate_contract.invalid?
  end

  test "multiple therapists can have contracts with same title" do
    contract = Contract.create(title: "Therapy Contract", therapist: @therapist, content: "Test content for first therapist")

    other_therapist = users(:other_therapist)
    other_contract = Contract.create(title: "Therapy Contract", therapist: other_therapist, content: "Test content for second therapist")

    assert contract.valid?
    assert other_contract.valid?
  end

  test "contract must belong to a therapist" do
    contract = Contract.new(title: "Therapy Contract", therapist: nil, content: "Just a test!")
    assert contract.invalid?
  end

  test "contract must have content" do
    contract = Contract.new(title: "Therapy Contract", therapist: @therapist, content: nil)
    assert contract.invalid?
  end
end
