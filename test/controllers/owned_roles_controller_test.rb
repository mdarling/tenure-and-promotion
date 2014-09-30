require 'test_helper'

class OwnedRolesControllerTest < ActionController::TestCase
  setup do
    @owned_role = owned_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owned_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owned_role" do
    assert_difference('OwnedRole.count') do
      post :create, owned_role: { role: @owned_role.role, user_id: @owned_role.user_id }
    end

    assert_redirected_to owned_role_path(assigns(:owned_role))
  end

  test "should show owned_role" do
    get :show, id: @owned_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owned_role
    assert_response :success
  end

  test "should update owned_role" do
    patch :update, id: @owned_role, owned_role: { role: @owned_role.role, user_id: @owned_role.user_id }
    assert_redirected_to owned_role_path(assigns(:owned_role))
  end

  test "should destroy owned_role" do
    assert_difference('OwnedRole.count', -1) do
      delete :destroy, id: @owned_role
    end

    assert_redirected_to owned_roles_path
  end
end
