require 'test_helper'

class StagPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stag_price = stag_prices(:one)
  end

  test "should get index" do
    get stag_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_stag_price_url
    assert_response :success
  end

  test "should create stag_price" do
    assert_difference('StagPrice.count') do
      post stag_prices_url, params: { stag_price: { name: @stag_price.name, package_id: @stag_price.package_id, price: @stag_price.price, stagID: @stag_price.stagID } }
    end

    assert_redirected_to stag_price_url(StagPrice.last)
  end

  test "should show stag_price" do
    get stag_price_url(@stag_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_stag_price_url(@stag_price)
    assert_response :success
  end

  test "should update stag_price" do
    patch stag_price_url(@stag_price), params: { stag_price: { name: @stag_price.name, package_id: @stag_price.package_id, price: @stag_price.price, stagID: @stag_price.stagID } }
    assert_redirected_to stag_price_url(@stag_price)
  end

  test "should destroy stag_price" do
    assert_difference('StagPrice.count', -1) do
      delete stag_price_url(@stag_price)
    end

    assert_redirected_to stag_prices_url
  end
end
