require 'test_helper'

class DefaultRolesControllerTest < ActionController::TestCase
  setup do
    @default_role = default_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:default_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create default_role" do
    assert_difference('DefaultRole.count') do
      post :create, default_role: { owner: @default_role.owner, role: @default_role.role }
    end

    assert_redirected_to default_role_path(assigns(:default_role))
  end

  test "should show default_role" do
    get :show, id: @default_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @default_role
    assert_response :success
  end

  test "should update default_role" do
    patch :update, id: @default_role, default_role: { owner: @default_role.owner, role: @default_role.role }
    assert_redirected_to default_role_path(assigns(:default_role))
  end

  test "should destroy default_role" do
    assert_difference('DefaultRole.count', -1) do
      delete :destroy, id: @default_role
    end

    assert_redirected_to default_roles_path
  end
end
