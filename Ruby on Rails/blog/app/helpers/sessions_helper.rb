module SessionsHelper

    # session 是 Rails 提供的方法，可以把 session 看做一个散列

    def log_in(user)
        session[:user_id] = user.id
    end

    # return user if in the session
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
            # @current_user = @current_user || User.find_by(id: session[:user_id])
        # 如果在临时会话 session 中找不到，去 cookies 中再次检索持久会话中存储的用户
        else cookies.signed[:user_id]
            # raise # 测试仍能通过，说明没有覆盖
            user = User.find_by(id: cookies.signed[:user_id])
            if user && user.authenticate?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    # 生成随机的记忆令牌及摘要，保存加密用户 id 和记忆令牌至 cookies
    # 未完 ---> 随后需要将这个逻辑加入 `current_user` 和 `logged_in?` 的判断中
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        user.forget   
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
