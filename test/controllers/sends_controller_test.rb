require 'test_helper'

class SendsControllerTest < ActionController::TestCase
  setup do
    @send = sends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create send" do
    assert_difference('Send.count') do
      post :create, send: {  }
    end

    assert_redirected_to send_path(assigns(:send))
  end

  test "should show send" do
    get :show, id: @send
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @send
    assert_response :success
  end

  test "should update send" do
    patch :update, id: @send, send: {  }
    assert_redirected_to send_path(assigns(:send))
  end

  test "should destroy send" do
    assert_difference('Send.count', -1) do
      delete :destroy, id: @send
    end

    assert_redirected_to sends_path
  end
end
