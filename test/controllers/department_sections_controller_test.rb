require 'test_helper'

class DepartmentSectionsControllerTest < ActionController::TestCase
  setup do
    @department_section = department_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department_section" do
    assert_difference('DepartmentSection.count') do
      post :create, department_section: { department_id: @department_section.department_id, section_id: @department_section.section_id }
    end

    assert_redirected_to department_section_path(assigns(:department_section))
  end

  test "should show department_section" do
    get :show, id: @department_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department_section
    assert_response :success
  end

  test "should update department_section" do
    patch :update, id: @department_section, department_section: { department_id: @department_section.department_id, section_id: @department_section.section_id }
    assert_redirected_to department_section_path(assigns(:department_section))
  end

  test "should destroy department_section" do
    assert_difference('DepartmentSection.count', -1) do
      delete :destroy, id: @department_section
    end

    assert_redirected_to department_sections_path
  end
end
