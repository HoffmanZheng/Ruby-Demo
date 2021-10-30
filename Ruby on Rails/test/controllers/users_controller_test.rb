require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:david)
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "redirect index when user not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  # TODO: 就算在 strong_parameter 中 permit 了 admin，也无法完成更新
  test "admin attribute is not allowed when update user" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@user), params: { user: {
      name: "name", email: "email", password: "", password_confirmation: "", admin: true
    } }
    @other_user.reload
    assert_not @other_user.admin?
  end

  test "redirect destroy when user not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "redirect destroy when user is not admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test "redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to login_url
  end

  test "redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end
end
