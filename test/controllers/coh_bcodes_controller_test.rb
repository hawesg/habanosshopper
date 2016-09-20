require 'test_helper'

class CohBcodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coh_bcode = coh_bcodes(:one)
  end

  test "should get index" do
    get coh_bcodes_url
    assert_response :success
  end

  test "should get new" do
    get new_coh_bcode_url
    assert_response :success
  end

  test "should create coh_bcode" do
    assert_difference('CohBcode.count') do
      post coh_bcodes_url, params: { coh_bcode: { bcode: @coh_bcode.bcode, coh_price_id: @coh_bcode.coh_price_id, name: @coh_bcode.name } }
    end

    assert_redirected_to coh_bcode_url(CohBcode.last)
  end

  test "should show coh_bcode" do
    get coh_bcode_url(@coh_bcode)
    assert_response :success
  end

  test "should get edit" do
    get edit_coh_bcode_url(@coh_bcode)
    assert_response :success
  end

  test "should update coh_bcode" do
    patch coh_bcode_url(@coh_bcode), params: { coh_bcode: { bcode: @coh_bcode.bcode, coh_price_id: @coh_bcode.coh_price_id, name: @coh_bcode.name } }
    assert_redirected_to coh_bcode_url(@coh_bcode)
  end

  test "should destroy coh_bcode" do
    assert_difference('CohBcode.count', -1) do
      delete coh_bcode_url(@coh_bcode)
    end

    assert_redirected_to coh_bcodes_url
  end
end
