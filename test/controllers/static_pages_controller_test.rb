require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get cssrule" do
    get static_pages_cssrule_url
    assert_response :success
  end

  test "should get test" do
    get static_pages_test_url
    assert_response :success
  end

end
