class ApplicationController < ActionController::Base
  layout false
  default_form_builder Ds::Forms::Builder
  add_flash_types :info, :success, :warning, :error
end
