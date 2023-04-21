require "capybara/rails"
require "capybara/rspec"

RSpec.configure do |config|
  config.include Capybara::RSpecMatchers, type: :view

  config.before(:each, type: :system) do
    driven_by(:selenium, using: :headless_firefox, screen_size: [1920, 1080])
  end
end
