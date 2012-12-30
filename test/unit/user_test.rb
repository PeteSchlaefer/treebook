# tests should always fail first and then you write the code 

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  	# so this checks to makes sure there IS an error.  ie if there is an error than the test is good.
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
	  user = User.new
    user.profile_name = "oiuy"
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "My Profile With Spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert !user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user should be able to submit a valid password" do
    user = User.new(:first_name => "Pete", :last_name => "Schlaefer", :email => "pete@liveramp.com")
    user.password = user.password_confirmation = "asdfasdf"
    user.profile_name = "petey_1"
    assert user.valid?
  end  

end
