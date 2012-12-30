require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected when not logged in and trying to create a new status" do
    get :new
    assert_response :redirect 
    assert_redirected_to new_user_session_path
  end

  test "should allow new status when user is logged in" do
    sign_in users(:jason)
    get :new
    assert_response :success 
  end

  test "should create status" do
    assert_difference('Status.count') do
      post :create, :status => @status.attributes
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, :id => @status.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @status.to_param
    assert_response :success
  end

  test "should update status" do
    put :update, :id => @status.to_param, :status => @status.attributes
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, :id => @status.to_param
    end

    assert_redirected_to statuses_path
  end
end
