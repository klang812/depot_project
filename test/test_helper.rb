ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  if ENV["SLOW"].present?
    require "selenium-webdriver"
    module ::Selenium::WebDriver::Remote
      class Bridge
        alias old_execute execute
  
        def execute(*args)
          sleep(1)
          old_execute(*args)
        end
      end
    end
  end

end
