require 'test_helper'

class RecusalsControllerTest < ActionController::TestCase
  setup do
    @recusal = recusals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recusals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recusal" do
    assert_difference('Recusal.count') do
      post :create, recusal: { candidate_id: @recusal.candidate_id, user_id: @recusal.user_id }
    end

    assert_redirected_to recusal_path(assigns(:recusal))
  end

  test "should show recusal" do
    get :show, id: @recusal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recusal
    assert_response :success
  end

  test "should update recusal" do
    patch :update, id: @recusal, recusal: { candidate_id: @recusal.candidate_id, user_id: @recusal.user_id }
    assert_redirected_to recusal_path(assigns(:recusal))
  end

  test "should destroy recusal" do
    assert_difference('Recusal.count', -1) do
      delete :destroy, id: @recusal
    end

    assert_redirected_to recusals_path
  end
end
