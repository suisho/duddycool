require 'test_helper'

class CopipesControllerTest < ActionController::TestCase
  setup do
    @copipe = copipes(:one)
    @tagstring = tags(:one).name + " "+ tags(:two).name
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
      post :create, copipe: { body: @copipe.body, title: @copipe.title }
    end

    assert_redirected_to :root
  end

  test "should create copipe with tags" do
    assert_difference('Copipe.count') do
      post :create,
            copipe: { body: @copipe.body, title: @copipe.title},
            tags: @tagstring
    end

    assert_redirected_to :root
  end

  test "should show copipe" do
    get :show, id: @copipe
    assert_response :success
  end

end
