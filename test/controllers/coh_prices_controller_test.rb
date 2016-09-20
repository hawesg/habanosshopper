require 'test_helper'

class CohPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coh_price = coh_prices(:one)
  end

  test "should get index" do
    get coh_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_coh_price_url
    assert_response :success
  end

  test "should create coh_price" do
    assert_difference('CohPrice.count') do
      post coh_prices_url, params: { coh_price: { name: @coh_price.name, package_id: @coh_price.package_id, price: @coh_price.price } }
    end

    assert_redirected_to coh_price_url(CohPrice.last)
  end

  test "should show coh_price" do
    get coh_price_url(@coh_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_coh_price_url(@coh_price)
    assert_response :success
  end

  test "should update coh_price" do
    patch coh_price_url(@coh_price), params: { coh_price: { name: @coh_price.name, package_id: @coh_price.package_id, price: @coh_price.price } }
    assert_redirected_to coh_price_url(@coh_price)
  end

  test "should destroy coh_price" do
    assert_difference('CohPrice.count', -1) do
      delete coh_price_url(@coh_price)
    end

    assert_redirected_to coh_prices_url
  end
end
