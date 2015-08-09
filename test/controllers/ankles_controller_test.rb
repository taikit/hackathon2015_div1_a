require 'test_helper'

class AnklesControllerTest < ActionController::TestCase
  setup do
    @ankle = ankles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ankles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ankle" do
    assert_difference('Ankle.count') do
      post :create, ankle: { image: @ankle.image }
    end

    assert_redirected_to ankle_path(assigns(:ankle))
  end

  test "should show ankle" do
    get :show, id: @ankle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ankle
    assert_response :success
  end

  test "should update ankle" do
    patch :update, id: @ankle, ankle: { image: @ankle.image }
    assert_redirected_to ankle_path(assigns(:ankle))
  end

  test "should destroy ankle" do
    assert_difference('Ankle.count', -1) do
      delete :destroy, id: @ankle
    end

    assert_redirected_to ankles_path
  end
end
