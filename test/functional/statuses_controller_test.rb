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

  test "should be logged in to post a status" do
    post :create, :status => {:content => "hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status when logged in" do
    sign_in users(:jason)
    assert_difference('Status.count') do
      post :create, :status => @status.attributes
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status when logged in" do
    get :show, :id => @status.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    get :edit, :id => @status.to_param
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  # i should probably hide the edit links for non-logged in users

  test "should update status when logged in" do
    sign_in users(:jason)
    put :update, :id => @status.to_param, :status => @status.attributes
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status when logged in" do
    sign_in users(:jason)
    assert_difference('Status.count', -1) do
      delete :destroy, :id => @status.to_param
    end

    assert_redirected_to statuses_path
  end
end
