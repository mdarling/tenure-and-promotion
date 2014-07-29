require 'test_helper'

class ProvostCommitteeFacultyViewControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
