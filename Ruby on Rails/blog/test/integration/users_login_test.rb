require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
  end

  # test to fix flash error after user registration
  test "correctly flash after failed login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_not is_logged_in?  # 新加的
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?   # flash should be empty after jump to another page
  end

  test "page change after successful login" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    # log out
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url

    # 用户在多个游览器窗口中已登录，然后在其中一个窗口退出后
    # 用户在第二个窗口退出时，会抛出异常，因为当前没有用户
    delete logout_path

    follow_redirect!
    assert_select "a[href=?]", login_path   # 使用持久会话后，用户无法退出
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0

  end
end
