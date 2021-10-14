require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @other_user = users(:david)
  end

  test "unsuccessful edit" do
    log_in_as(@user, remember_me: '0')    # pass the pre_filter
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
      email: "foo@invalid", password: "foo", password_confirmation: "bar" } }
    assert_template 'users/edit'   
  end

  test "successful edit" do
    log_in_as(@user, remember_me: '0')      # pass the pre_filter
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: {
      name: name, email: email, password: "", password_confirmation: ""
    } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload     # 重新加载数据库中的值
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "pre-filter works for edit" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "pre-filter works for update" do
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: {
      name: name, email: email, password: "", password_confirmation: ""
    } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "user can only edit his own profile" do
    log_in_as(@other_user, remember_me: '0')
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "user can only update his own profile" do
    name = "Foo Bar"
    email = "foo@bar.com"
    log_in_as(@other_user, remember_me: '0')
    patch user_path(@user), params: { user: {
      name: name, email: email, password: "", password_confirmation: ""
    } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)  # 登录后跳转到原始页面
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: {
      name: name, email: email, password: "", password_confirmation: ""
    } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload     # 重新加载数据库中的值
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
