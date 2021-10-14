require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "redirect index when user not logged in" do
    get users_path
    assert_redirected_to login_url
  end
end
