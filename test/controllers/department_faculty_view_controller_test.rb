require 'test_helper'

class DepartmentFacultyViewControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
