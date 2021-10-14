ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"  # new
Minitest::Reporters.use!      # new

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper # for the use of full_name method

  # Add more helper methods to be used by all tests here...


  # 不能像 sessions_helper 那样使用 current_user，但是可以使用 session 方法
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: 
      { email: user.email, password: password, remember_me: remember_me } }
  end
end
