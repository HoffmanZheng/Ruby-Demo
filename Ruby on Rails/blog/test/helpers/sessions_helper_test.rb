require "test_helper"

class SessionsHelperTest < ActionView::TestCase
    
    def setup
        @user = users(:michael)
        remember(@user)
    end

    # 验证 session 不存在时，cookie 能够正常工作
    test "current_user returns right user when session is nil" do
        assert_equal @user, current_user
        assert is_logged_in?
    end

    # 如果 cookies 中保存了错误的记忆令牌摘要，current_user 应返回 nil
    test "current_user returns nil when remember digest is wrong" do
        @user.update_attribute(:remember_digest, User.digest(User.new_token))
        assert_nil current_user
    end

end