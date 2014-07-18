require 'test_helper'

class ThemeReflectionsControllerTest < ActionController::TestCase
  setup do
    @theme_reflection = theme_reflections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theme_reflections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theme_reflection" do
    assert_difference('ThemeReflection.count') do
      post :create, theme_reflection: { question: @theme_reflection.question }
    end

    assert_redirected_to theme_reflection_path(assigns(:theme_reflection))
  end

  test "should show theme_reflection" do
    get :show, id: @theme_reflection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theme_reflection
    assert_response :success
  end

  test "should update theme_reflection" do
    patch :update, id: @theme_reflection, theme_reflection: { question: @theme_reflection.question }
    assert_redirected_to theme_reflection_path(assigns(:theme_reflection))
  end

  test "should destroy theme_reflection" do
    assert_difference('ThemeReflection.count', -1) do
      delete :destroy, id: @theme_reflection
    end

    assert_redirected_to theme_reflections_path
  end
end
