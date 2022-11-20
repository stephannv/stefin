require "clearance/rspec"

module Clearance::RequestHelpers
  def sign_in(user = create(:user, password: "test123"))
    post session_path, params: {session: {email: user.email, password: "test123"}}
    user
  end
end

RSpec::Matchers.define :require_login do |expected|
  supports_block_expectations

  match do |actual|
    actual.call

    expected_body = 'You are being <a href="http://www.example.com/sign_in">redirected</a>'
    response.body.include?(expected_body) && response.status == 302
  end

  failure_message do |actual|
    "expected that #{response.request.path} to require login but it isn't required"
  end

  failure_message_when_negated do |actual|
    "expected that #{response.request.path} to not require login but it's required"
  end
end

RSpec.configure do |config|
  config.include Clearance::RequestHelpers, type: :request
end
