require 'test_helper'

class MyDemandsControllerTest < ActionDispatch::IntegrationTest
  test "should get mydemand" do
    get my_demands_mydemand_url
    assert_response :success
  end

  test "should get myhelp" do
    get my_demands_myhelp_url
    assert_response :success
  end

end
