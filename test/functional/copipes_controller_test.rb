require 'test_helper'

class CopipesControllerTest < ActionController::TestCase
  setup do
    @copipe = copipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copipe" do
    assert_difference('Copipe.count') do
      post :create, copipe: { body: @copipe.body, title: @copipe.title, user_id: @copipe.user_id }
    end

    assert_redirected_to copipe_path(assigns(:copipe))
  end

  test "should show copipe" do
    get :show, id: @copipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @copipe
    assert_response :success
  end

  test "should update copipe" do
    put :update, id: @copipe, copipe: { body: @copipe.body, title: @copipe.title, user_id: @copipe.user_id }
    assert_redirected_to copipe_path(assigns(:copipe))
  end

  test "should destroy copipe" do
    assert_difference('Copipe.count', -1) do
      delete :destroy, id: @copipe
    end

    assert_redirected_to copipes_path
  end
end
