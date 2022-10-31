require "capybara/rails"
require "capybara/rspec"

RSpec.configure do |config|
  config.include Capybara::RSpecMatchers, type: :view

  config.before(:each, type: :system) do
    driven_by(:selenium_chrome_headless)
    Capybara.current_session.current_window.resize_to(1920, 1080)
  end
end
