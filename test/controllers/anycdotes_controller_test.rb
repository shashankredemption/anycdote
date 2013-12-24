require 'test_helper'

class AnycdotesControllerTest < ActionController::TestCase
  setup do
    @anycdote = anycdotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anycdotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anycdote" do
    assert_difference('Anycdote.count') do
      post :create, anycdote: { location: @anycdote.location, story: @anycdote.story, title: @anycdote.title }
    end

    assert_redirected_to anycdote_path(assigns(:anycdote))
  end

  test "should show anycdote" do
    get :show, id: @anycdote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anycdote
    assert_response :success
  end

  test "should update anycdote" do
    patch :update, id: @anycdote, anycdote: { location: @anycdote.location, story: @anycdote.story, title: @anycdote.title }
    assert_redirected_to anycdote_path(assigns(:anycdote))
  end

  test "should destroy anycdote" do
    assert_difference('Anycdote.count', -1) do
      delete :destroy, id: @anycdote
    end

    assert_redirected_to anycdotes_path
  end
end
