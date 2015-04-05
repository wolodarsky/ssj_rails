require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @store = stores(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create store" do
    sign_in @user
    assert_difference('Store.count') do
      post :create, store: { address_1: @store.address_1, address_2: @store.address_2, city: @store.city, name: @store.name, phone: @store.phone, state: @store.state, url: @store.url, zipcode: @store.zipcode }
    end

    assert_redirected_to store_path(assigns(:store))
  end

  test "should show store" do
    get :show, id: @store
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @store
    assert_response :success
  end

  test "should update store" do
    sign_in @user
    patch :update, id: @store, store: { address_1: @store.address_1, address_2: @store.address_2, city: @store.city, name: @store.name, phone: @store.phone, state: @store.state, url: @store.url, zipcode: @store.zipcode }
    assert_redirected_to store_path(assigns(:store))
  end

  test "should destroy store" do
    sign_in @user
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_redirected_to stores_path
  end
end
