require 'test_helper'

class CandidateProfilesControllerTest < ActionController::TestCase
  setup do
    @candidate_profile = candidate_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_profile" do
    assert_difference('CandidateProfile.count') do
      post :create, candidate_profile: { Additional_Materials: @candidate_profile.Additional_Materials, Curriculum_Vitae: @candidate_profile.Curriculum_Vitae, Research_Statement: @candidate_profile.Research_Statement, Service_statement_in: @candidate_profile.Service_statement_in, Teaching_Statement: @candidate_profile.Teaching_Statement, User_department_id: @candidate_profile.User_department_id, candidate_profile_id: @candidate_profile.candidate_profile_id, user_id: @candidate_profile.user_id }
    end

    assert_redirected_to candidate_profile_path(assigns(:candidate_profile))
  end

  test "should show candidate_profile" do
    get :show, id: @candidate_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_profile
    assert_response :success
  end

  test "should update candidate_profile" do
    patch :update, id: @candidate_profile, candidate_profile: { Additional_Materials: @candidate_profile.Additional_Materials, Curriculum_Vitae: @candidate_profile.Curriculum_Vitae, Research_Statement: @candidate_profile.Research_Statement, Service_statement_in: @candidate_profile.Service_statement_in, Teaching_Statement: @candidate_profile.Teaching_Statement, User_department_id: @candidate_profile.User_department_id, candidate_profile_id: @candidate_profile.candidate_profile_id, user_id: @candidate_profile.user_id }
    assert_redirected_to candidate_profile_path(assigns(:candidate_profile))
  end

  test "should destroy candidate_profile" do
    assert_difference('CandidateProfile.count', -1) do
      delete :destroy, id: @candidate_profile
    end

    assert_redirected_to candidate_profiles_path
  end
end
