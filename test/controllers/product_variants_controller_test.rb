require 'test_helper'

class ProductVariantsControllerTest < ActionController::TestCase
  setup do
    @product_variant = product_variants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_variants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # can't test without first create a product
  # test "should create product_variant" do
    # assert_difference('ProductVariant.count') do
      # post :create, product_variant: { options: @product_variant.options, primary_photo_id: @product_variant.primary_photo_id, product_id: @product_variant.product_id, product_variant_number: @product_variant.product_variant_number }
    # end

    # assert_redirected_to product_variant_path(assigns(:product_variant))
  # end

  test "should show product_variant" do
    get :show, id: @product_variant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_variant
    assert_response :success
  end

  test "should update product_variant" do
    patch :update, id: @product_variant, product_variant: { options: @product_variant.options, primary_photo_id: @product_variant.primary_photo_id, product_id: @product_variant.product_id, product_variant_number: @product_variant.product_variant_number }
    assert_redirected_to product_variant_path(assigns(:product_variant))
  end

  test "should destroy product_variant" do
    assert_difference('ProductVariant.count', -1) do
      delete :destroy, id: @product_variant
    end

    assert_redirected_to product_variants_path
  end
end
