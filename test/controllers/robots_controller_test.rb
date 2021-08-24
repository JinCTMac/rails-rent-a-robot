require 'test_helper'

class RobotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get robots_new_url
    assert_response :success
  end

  test "should get create" do
    get robots_create_url
    assert_response :success
  end

end
