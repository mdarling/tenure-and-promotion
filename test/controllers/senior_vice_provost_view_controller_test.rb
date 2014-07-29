require 'test_helper'

class SeniorViceProvostViewControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
