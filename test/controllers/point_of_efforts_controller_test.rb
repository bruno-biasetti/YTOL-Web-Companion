require 'test_helper'

class PointOfEffortsControllerTest < ActionController::TestCase
  setup do
    @point_of_effort = point_of_efforts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_of_efforts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point_of_effort" do
    assert_difference('PointOfEffort.count') do
      post :create, point_of_effort: { description: @point_of_effort.description, due_date: @point_of_effort.due_date, title: @point_of_effort.title, user_id: @point_of_effort.user_id }
    end

    assert_redirected_to point_of_effort_path(assigns(:point_of_effort))
  end

  test "should show point_of_effort" do
    get :show, id: @point_of_effort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @point_of_effort
    assert_response :success
  end

  test "should update point_of_effort" do
    patch :update, id: @point_of_effort, point_of_effort: { description: @point_of_effort.description, due_date: @point_of_effort.due_date, title: @point_of_effort.title, user_id: @point_of_effort.user_id }
    assert_redirected_to point_of_effort_path(assigns(:point_of_effort))
  end

  test "should destroy point_of_effort" do
    assert_difference('PointOfEffort.count', -1) do
      delete :destroy, id: @point_of_effort
    end

    assert_redirected_to point_of_efforts_path
  end
end
