class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_action :require_login

  layout false
  default_form_builder Ds::FormBuilder
  add_flash_types :info, :success, :warning, :error

  private

  def current_accounts
    scope = authorized_scope(Account.all, with: AccountPolicy)
    Accounts::List.result(scope: scope).accounts
  end

  def current_categories
    scope = authorized_scope(Category.all, with: CategoryPolicy)
    Categories::List.result(scope: scope).categories
  end
end
