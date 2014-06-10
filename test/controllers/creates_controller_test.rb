require 'test_helper'

class CreatesControllerTest < ActionController::TestCase
  setup do
    @create = creates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:creates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create create" do
    assert_difference('Create.count') do
      post :create, create: {  }
    end

    assert_redirected_to create_path(assigns(:create))
  end

  test "should show create" do
    get :show, id: @create
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @create
    assert_response :success
  end

  test "should update create" do
    patch :update, id: @create, create: {  }
    assert_redirected_to create_path(assigns(:create))
  end

  test "should destroy create" do
    assert_difference('Create.count', -1) do
      delete :destroy, id: @create
    end

    assert_redirected_to creates_path
  end
end
