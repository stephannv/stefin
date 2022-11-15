class ApplicationController < ActionController::Base
  layout false
  default_form_builder Ds::FormBuilder
  add_flash_types :info, :success, :warning, :error
end
