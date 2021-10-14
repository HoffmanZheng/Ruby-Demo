require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @non_admin =users(:david)
  end

  test "index including pagination, delete link as admin" do   # 分页插件正常生效
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      unless user == @user
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin, cannot see delete link" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

end
