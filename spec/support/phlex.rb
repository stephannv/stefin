module Phlex
  module TestHelpers
    def render(view)
      Nokogiri::HTML.fragment(view.call(view_context: controller.view_context))
    end
  end
end

RSpec.configure do |config|
  config.include Phlex::TestHelpers, type: :view
end
