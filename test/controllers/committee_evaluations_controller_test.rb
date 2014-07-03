require 'test_helper'

class CommitteeEvaluationsControllerTest < ActionController::TestCase
  setup do
    @committee_evaluation = committee_evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:committee_evaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create committee_evaluation" do
    assert_difference('CommitteeEvaluation.count') do
      post :create, committee_evaluation: { committee_department_college_id: @committee_evaluation.committee_department_college_id, committee_department_id: @committee_evaluation.committee_department_id, committee_evaluation_id: @committee_evaluation.committee_evaluation_id, committee_id: @committee_evaluation.committee_id, review_candidate_profile_id: @committee_evaluation.review_candidate_profile_id, review_id: @committee_evaluation.review_id }
    end

    assert_redirected_to committee_evaluation_path(assigns(:committee_evaluation))
  end

  test "should show committee_evaluation" do
    get :show, id: @committee_evaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @committee_evaluation
    assert_response :success
  end

  test "should update committee_evaluation" do
    patch :update, id: @committee_evaluation, committee_evaluation: { committee_department_college_id: @committee_evaluation.committee_department_college_id, committee_department_id: @committee_evaluation.committee_department_id, committee_evaluation_id: @committee_evaluation.committee_evaluation_id, committee_id: @committee_evaluation.committee_id, review_candidate_profile_id: @committee_evaluation.review_candidate_profile_id, review_id: @committee_evaluation.review_id }
    assert_redirected_to committee_evaluation_path(assigns(:committee_evaluation))
  end

  test "should destroy committee_evaluation" do
    assert_difference('CommitteeEvaluation.count', -1) do
      delete :destroy, id: @committee_evaluation
    end

    assert_redirected_to committee_evaluations_path
  end
end
