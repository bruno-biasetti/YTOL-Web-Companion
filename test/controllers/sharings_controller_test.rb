require 'test_helper'

class SharingsControllerTest < ActionController::TestCase
  setup do
    @sharing = sharings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sharings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sharing" do
    assert_difference('Sharing.count') do
      post :create, sharing: { family_relationship: @sharing.family_relationship, god_relationship: @sharing.god_relationship, spiritual_life: @sharing.spiritual_life, testimony_to_society: @sharing.testimony_to_society }
    end

    assert_redirected_to sharing_path(assigns(:sharing))
  end

  test "should show sharing" do
    get :show, id: @sharing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sharing
    assert_response :success
  end

  test "should update sharing" do
    patch :update, id: @sharing, sharing: { family_relationship: @sharing.family_relationship, god_relationship: @sharing.god_relationship, spiritual_life: @sharing.spiritual_life, testimony_to_society: @sharing.testimony_to_society }
    assert_redirected_to sharing_path(assigns(:sharing))
  end

  test "should destroy sharing" do
    assert_difference('Sharing.count', -1) do
      delete :destroy, id: @sharing
    end

    assert_redirected_to sharings_path
  end
end
