module Accounts
  class IndexPage < ApplicationView
    def template
      render Layout::Base.new do
        render Layout::Shell.new do
          h1 { t(".accounts") }
        end
      end
    end
  end
end
