class AccountsController < ApplicationController
  def index
    result = Accounts::List.result

    render Accounts::Pages::Index.new(accounts: result.accounts)
  end

  def new
    render Accounts::Pages::New.new(account: Account.new)
  end

  def edit
    result = Accounts::Find.result(id: params[:id])

    render Accounts::Pages::Edit.new(account: result.account)
  end

  def create
    result = Accounts::Create.result(attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::Pages::New.new(account: result.account), status: :unprocessable_entity
    end
  end

  def update
    result = Accounts::Update.result(id: params[:id], attributes: account_params)

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      render Accounts::Pages::Edit.new(account: result.account), status: :unprocessable_entity
    end
  end

  def destroy
    result = Accounts::Destroy.result(id: params[:id])

    if result.success?
      redirect_to accounts_path, success: t(".success")
    else
      redirect_to edit_account_path(result.account), error: t(".error")
    end
  end

  private

  def account_params
    params.require(:account).permit(:title, :color).to_h
  end
end
