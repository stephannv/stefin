class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_action :require_login

  layout false
  default_form_builder Ds::FormBuilder
  add_flash_types :info, :success, :warning, :error
end
