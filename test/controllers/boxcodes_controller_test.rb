require 'test_helper'

class BoxcodesControllerTest < ActionDispatch::IntegrationTest
  test "should get coh" do
    get boxcodes_coh_url
    assert_response :success
  end

  test "should get stagnetto" do
    get boxcodes_stagnetto_url
    assert_response :success
  end

end
