require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "that the /sign_in route opens the signin page" do

  	get "/sign_in"

  	assert_response :success
  	
  end

  test "that the /sign_out route opens the signin page" do

  	get "/sign_out"

  	assert_response :redirect 

  	assert_redirected_to '/'
  	
  end

  test "that the /register route opens the signin page" do

  	get "/register"

  	assert_response :success
  	
  end


end
