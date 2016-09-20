require 'test_helper'

class StagBcodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stag_bcode = stag_bcodes(:one)
  end

  test "should get index" do
    get stag_bcodes_url
    assert_response :success
  end

  test "should get new" do
    get new_stag_bcode_url
    assert_response :success
  end

  test "should create stag_bcode" do
    assert_difference('StagBcode.count') do
      post stag_bcodes_url, params: { stag_bcode: { bcode: @stag_bcode.bcode, name: @stag_bcode.name, stagID: @stag_bcode.stagID, stag_price_id: @stag_bcode.stag_price_id } }
    end

    assert_redirected_to stag_bcode_url(StagBcode.last)
  end

  test "should show stag_bcode" do
    get stag_bcode_url(@stag_bcode)
    assert_response :success
  end

  test "should get edit" do
    get edit_stag_bcode_url(@stag_bcode)
    assert_response :success
  end

  test "should update stag_bcode" do
    patch stag_bcode_url(@stag_bcode), params: { stag_bcode: { bcode: @stag_bcode.bcode, name: @stag_bcode.name, stagID: @stag_bcode.stagID, stag_price_id: @stag_bcode.stag_price_id } }
    assert_redirected_to stag_bcode_url(@stag_bcode)
  end

  test "should destroy stag_bcode" do
    assert_difference('StagBcode.count', -1) do
      delete stag_bcode_url(@stag_bcode)
    end

    assert_redirected_to stag_bcodes_url
  end
end
