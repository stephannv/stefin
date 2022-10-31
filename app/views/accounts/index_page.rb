module Accounts
  class IndexPage < ApplicationView
    def template
      render Layouts::Base.new do
        render Layouts::Shell.new do
          h1 { t(".accounts") }
        end
      end
    end
  end
end
