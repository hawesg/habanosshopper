require 'test_helper'

class VitolasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vitola = vitolas(:one)
  end

  test "should get index" do
    get vitolas_url
    assert_response :success
  end

  test "should get new" do
    get new_vitola_url
    assert_response :success
  end

  test "should create vitola" do
    assert_difference('Vitola.count') do
      post vitolas_url, params: { vitola: { length: @vitola.length, marca: @vitola.marca, region: @vitola.region, releaseType: @vitola.releaseType, rg: @vitola.rg, vitola: @vitola.vitola, year: @vitola.year } }
    end

    assert_redirected_to vitola_url(Vitola.last)
  end

  test "should show vitola" do
    get vitola_url(@vitola)
    assert_response :success
  end

  test "should get edit" do
    get edit_vitola_url(@vitola)
    assert_response :success
  end

  test "should update vitola" do
    patch vitola_url(@vitola), params: { vitola: { length: @vitola.length, marca: @vitola.marca, region: @vitola.region, releaseType: @vitola.releaseType, rg: @vitola.rg, vitola: @vitola.vitola, year: @vitola.year } }
    assert_redirected_to vitola_url(@vitola)
  end

  test "should destroy vitola" do
    assert_difference('Vitola.count', -1) do
      delete vitola_url(@vitola)
    end

    assert_redirected_to vitolas_url
  end
end
