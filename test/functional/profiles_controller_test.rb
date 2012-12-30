
require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, :id => users(:jason).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 when profile not found" do
    get :show, :id => "adofsjasljnas;dofjnas"
    assert_response :not_found
  end

  test "ensure instance variables are properly assigned" do
    get :show, :id => users(:jason).profile_name
    assert assigns(:user)
    assert assigns(:statuses)
    # assert_not_empty 'not defined'
  end

  test "only status belonging to user show up" do
    get :show, :id => users(:jason).profile_name
    assigns(:statuses).each do |status|
    	assert_equal users(:jason), status.user
    end
  end	  

end
