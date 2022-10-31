class AccountsController < ApplicationController
  def index
    render Accounts::IndexPage.new
  end
end
