require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { begin: @review.begin, candidate_profile_id: @review.candidate_profile_id, college_type: @review.college_type, commitee_id: @review.commitee_id, committee_department_college_id: @review.committee_department_college_id, committee_department_id: @review.committee_department_id, committee_id: @review.committee_id, end: @review.end, review_id: @review.review_id }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { begin: @review.begin, candidate_profile_id: @review.candidate_profile_id, college_type: @review.college_type, commitee_id: @review.commitee_id, committee_department_college_id: @review.committee_department_college_id, committee_department_id: @review.committee_department_id, committee_id: @review.committee_id, end: @review.end, review_id: @review.review_id }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
