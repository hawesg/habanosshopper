require 'test_helper'

class VendorsControllerTest < ActionDispatch::IntegrationTest
  test "should get coh" do
    get vendors_coh_url
    assert_response :success
  end

  test "should get ihavana" do
    get vendors_ihavana_url
    assert_response :success
  end

  test "should get stagnetto" do
    get vendors_stagnetto_url
    assert_response :success
  end

end
