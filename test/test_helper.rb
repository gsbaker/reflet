ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    include SessionTestHelper

    setup do
      @therapist = users(:therapist)
      @other_therapist = users(:other_therapist)
      @individual = users(:individual)
      @other_individual = users(:other_individual)
    end
  end
end
