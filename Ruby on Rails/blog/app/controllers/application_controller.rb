# ---> ActionController: base controller provided by the Rails library Action Pack
# ---> since all Rails controllers inherit from ApplicationController
# ---> rules defined in the Application controller automatically apply
# ---> to every action in the application
# ---> 9.1 includes helpers for logging in and logging out of all controllers
class ApplicationController < ActionController::Base
    include SessionsHelper

    def hello
        render html: "hello world!"
    end
    
    private 
      def logged_in_user
        unless logged_in?
          store_location   # 需要拦截的页面，存储原始页面，供登录后跳转使用
          flash[:danger] = "Please log in."
          redirect_to login_url
        end 
      end
end
