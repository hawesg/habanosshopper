require 'test_helper'

class IhPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ih_price = ih_prices(:one)
  end

  test "should get index" do
    get ih_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_ih_price_url
    assert_response :success
  end

  test "should create ih_price" do
    assert_difference('IhPrice.count') do
      post ih_prices_url, params: { ih_price: { name: @ih_price.name, package_id: @ih_price.package_id, price: @ih_price.price } }
    end

    assert_redirected_to ih_price_url(IhPrice.last)
  end

  test "should show ih_price" do
    get ih_price_url(@ih_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_ih_price_url(@ih_price)
    assert_response :success
  end

  test "should update ih_price" do
    patch ih_price_url(@ih_price), params: { ih_price: { name: @ih_price.name, package_id: @ih_price.package_id, price: @ih_price.price } }
    assert_redirected_to ih_price_url(@ih_price)
  end

  test "should destroy ih_price" do
    assert_difference('IhPrice.count', -1) do
      delete ih_price_url(@ih_price)
    end

    assert_redirected_to ih_prices_url
  end
end
