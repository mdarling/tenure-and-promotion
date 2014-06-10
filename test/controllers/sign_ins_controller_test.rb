require 'test_helper'

class SignInsControllerTest < ActionController::TestCase
  setup do
    @sign_in = sign_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sign_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sign_in" do
    assert_difference('SignIn.count') do
      post :create, sign_in: {  }
    end

    assert_redirected_to sign_in_path(assigns(:sign_in))
  end

  test "should show sign_in" do
    get :show, id: @sign_in
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sign_in
    assert_response :success
  end

  test "should update sign_in" do
    patch :update, id: @sign_in, sign_in: {  }
    assert_redirected_to sign_in_path(assigns(:sign_in))
  end

  test "should destroy sign_in" do
    assert_difference('SignIn.count', -1) do
      delete :destroy, id: @sign_in
    end

    assert_redirected_to sign_ins_path
  end
end
