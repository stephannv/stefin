class AccountsController < ApplicationController
  def index
    render Accounts::Pages::Index.new
  end

  def new
    render Accounts::Pages::New.new(account: Account.new)
  end

  def create
    result = Accounts::Create.result(attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::Pages::New.new(account: result.account), status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:title, :color).to_h
  end
end
