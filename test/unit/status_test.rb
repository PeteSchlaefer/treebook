
require 'test_helper'

class StatusTest < ActiveSupport::TestCase

	test "a status must have content and not be blank" do
		
		status = Status.new
		assert !status.save
		assert !status.errors[:content].empty?

	end

	test "a status must have at least 2 characters" do
		
		status = Status.new
		status.content = "H"
		assert !status.save
		assert !status.errors[:content].empty?

	end

	test "a status must have a user id" do
		
		status = Status.new
		status.content = "Hello"
		assert !status.save
		assert !status.errors[:user_id].empty?

	end

end
