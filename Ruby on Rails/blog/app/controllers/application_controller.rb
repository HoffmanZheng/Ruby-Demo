# ---> ActionController: base controller provided by the Rails library Action Pack
# ---> since all Rails controllers inherit from ApplicationController
# ---> rules defined in the Application controller automatically apply
# ---> to every action in the application
# ---> 9.1 includes helpers for logging in and logging out of all controllers
class ApplicationController < ActionController::Base
    def hello
        render html: "hello world!"
    end
end
