ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def is_logged_in?
    !session[:user_id].nil?
  end

  # login as particular user
  def log_in_as(user)
    session[:user_id] = user.id
  end

  def log_in(user)
    session[:user_id] = user.id
  end
  def admin?(user)
    return true if user.admin == true
  end

  # Add more helper methods to be used by all tests here...
end
