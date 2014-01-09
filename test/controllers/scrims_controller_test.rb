require 'test_helper'

class ScrimsControllerTest < ActionController::TestCase
  setup do
    @scrim = scrims(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrim" do
    assert_difference('Scrim.count') do
      post :create, scrim: { location: @scrim.location, mmr: @scrim.mmr, player: @scrim.player }
    end

    assert_redirected_to scrim_path(assigns(:scrim))
  end

  test "should show scrim" do
    get :show, id: @scrim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrim
    assert_response :success
  end

  test "should update scrim" do
    patch :update, id: @scrim, scrim: { location: @scrim.location, mmr: @scrim.mmr, player: @scrim.player }
    assert_redirected_to scrim_path(assigns(:scrim))
  end

  test "should destroy scrim" do
    assert_difference('Scrim.count', -1) do
      delete :destroy, id: @scrim
    end

    assert_redirected_to scrims_path
  end
end
