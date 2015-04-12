require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @store = stores(:one)
    @user = users(:regular)
    @admin_user = users(:admin)
  end

  test "should get all" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get single" do
    get :show, id: @store
    assert_response :success
  end

  test "non-admin SHOULD NOT be able to create" do
    sign_in @user
    assert_no_difference('Store.count') do
      post :create, store: { address_1: @store.address_1, address_2: @store.address_2, city: @store.city, name: @store.name, phone: @store.phone, state: @store.state, url: @store.url, zipcode: @store.zipcode }
    end

    assert_response :unauthorized
  end

  test "non-admin SHOULD NOT be able to update" do
    sign_in @user
    patch :update, id: @store, store: { address_1: @store.address_1, address_2: @store.address_2, city: @store.city, name: @store.name, phone: @store.phone, state: @store.state, url: @store.url, zipcode: @store.zipcode }
    assert_response :unauthorized
  end

  test "non-admin SHOULD NOT be able to destroy" do
    sign_in @user
    assert_no_difference('Store.count') do
      delete :destroy, id: @store
    end

    assert_response :unauthorized
  end

  test "admin SHOULD be able to create" do
    sign_in @admin_user
    assert_difference('Store.count') do
      post :create, store: { address_1: @store.address_1, address_2: @store.address_2, city: @store.city, name: @store.name, phone: @store.phone, state: @store.state, url: @store.url, zipcode: @store.zipcode }
    end

    assert_response :created
  end

  test "admin SHOULD be able to update" do
    sign_in @admin_user
    patch :update, id: @store, store: { address_1: @store.address_1, address_2: @store.address_2, city: @store.city, name: @store.name, phone: @store.phone, state: @store.state, url: @store.url, zipcode: @store.zipcode }
    assert_response :success
  end

  test "admin SHOULD be able to destroy" do
    sign_in @admin_user
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_response :success
  end
end
